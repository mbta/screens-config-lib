defmodule ScreensConfig.V2.OnBus do
  @moduledoc false

  alias ScreensConfig.V2.Header.CurrentStopId

  @type t :: %__MODULE__{}

  @enforce_keys []

  defstruct header: nil

  use ScreensConfig.Struct,
    children: []
end
