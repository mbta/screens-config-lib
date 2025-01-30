defmodule ScreensConfig.V2.OnBus do
  @moduledoc false

  alias ScreensConfig.V2.Header.Header.BusId

  @type t :: %__MODULE__{
          header: BusId.t()
        }

  @enforce_keys [
    :header
  ]

  defstruct header: nil

  use ScreensConfig.Struct,
    children: [
      header: BusId
    ]
end
