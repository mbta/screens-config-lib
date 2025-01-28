defmodule ScreensConfig.V2.OnBus do
  @moduledoc false

  alias ScreensConfig.V2.Header.CurrentStopId

  @type t :: %__MODULE__{
          header: CurrentStopId.t(),
        }

  @enforce_keys [
    :header,
  ]

  defstruct header: nil

  use ScreensConfig.Struct,
    children: [
      header: CurrentStopId,
    ]
end
