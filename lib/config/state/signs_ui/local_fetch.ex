defmodule ScreensConfig.State.SignsUi.LocalFetch do
  @moduledoc false

  alias ScreensConfig.State.SignsUi.Parse
  @behaviour ScreensConfig.State.Fetch

  @impl true
  def fetch_config(current_version) do
    with {:ok, file_contents, _} <- get_config(current_version),
         {:ok, decoded} <- Jason.decode(file_contents) do
      {:ok, Parse.parse_config(decoded), current_version}
    else
      _ -> :error
    end
  end

  @impl true
  def get_config(current_version \\ nil) do
    case File.read(local_config_path()) do
      {:ok, contents} -> {:ok, contents, current_version}
      _ -> :error
    end
  end

  @impl true
  def put_config(contents) do
    case File.write(local_config_path(), contents) do
      :ok -> :ok
      {:error, _} -> :error
    end
  end

  defp local_config_path do
    case Application.get_env(:screens, :local_signs_ui_config_file_spec) do
      {:priv, file_name} -> Path.join(:code.priv_dir(:screens), file_name)
      {:test, file_name} -> Path.join(~w[#{File.cwd!()} test fixtures #{file_name}])
    end
  end
end
