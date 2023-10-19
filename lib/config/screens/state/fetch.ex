defmodule ScreensConfig.Screens.State.Fetch do
  @moduledoc false

  @callback get_config(Fetch.version_id()) ::
              {:ok, String.t(), Fetch.version_id()} | :unchanged | :error

  @callback put_config(String.t()) :: :ok | :error
end
