defmodule Config.Fetch.S3Fetch do
  def get_config(current_version \\ nil) do
    bucket = Application.get_env(:screens, :config_s3_bucket)
    path = config_path_for_environment()

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
        # _ = Logger.info("s3_config_fetch_error #{inspect(err)}")
        :error
    end
  end

  defp config_path_for_environment do
    "screens/screens-prod.json"
  end
end
