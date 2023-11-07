defmodule ScreensConfig.State.SignsUi.S3Fetch do
  @moduledoc false

  require Logger
  alias ScreensConfig.State.SignsUi.Parse
  @behaviour ScreensConfig.State.Fetch

  @impl true
  def fetch_config(current_version) do
    with {:ok, body, new_version} <- get_config(current_version),
         {:ok, decoded} <- Jason.decode(body) do
      {:ok, Parse.parse_config(decoded), new_version}
    else
      :unchanged -> :unchanged
      _ -> :error
    end
  end

  @impl true
  def get_config(current_version \\ nil) do
    bucket = Application.get_env(:screens, :signs_ui_s3_bucket)
    path = Application.get_env(:screens, :signs_ui_s3_path)

    opts =
      case current_version do
        nil -> []
        _ -> [if_none_match: current_version]
      end

    get_operation = ExAws.S3.get_object(bucket, path, opts)

    case ExAws.request(get_operation) do
      {:ok, %{status_code: 304}} ->
        :unchanged

      {:ok, %{body: body, headers: headers, status_code: 200}} ->
        etag =
          headers
          |> Enum.into(%{})
          |> Map.get("ETag")

        {:ok, body, etag}

      {:error, err} ->
        _ = Logger.info("s3_signs_ui_config_fetch_error #{inspect(err)}")
        :error
    end
  end

  @impl true
  def put_config(contents) do
    bucket = Application.get_env(:screens, :signs_ui_s3_bucket)
    path = Application.get_env(:screens, :signs_ui_s3_path)
    put_operation = ExAws.S3.put_object(bucket, path, contents)

    case ExAws.request(put_operation) do
      {:ok, %{status_code: 200}} -> :ok
      _ -> :error
    end
  end
end
