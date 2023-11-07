defmodule ScreensConfig.State.Fetch do
  @moduledoc false

  @type version_id :: String.t() | nil

  @callback fetch_config(version_id()) :: {:ok, term(), version_id} | :unchanged | :error

  @callback get_config(version_id()) ::
              {:ok, String.t(), version_id()} | :unchanged | :error

  @callback put_config(String.t()) :: :ok | :error
end
