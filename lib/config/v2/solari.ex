defmodule ScreensConfig.V2.Solari do
  @moduledoc false

  alias ScreensConfig.V2.Departures
  alias ScreensConfig.V2.Header.CurrentStopName

  @type t :: %__MODULE__{
          departures: Departures.t(),
          header: CurrentStopName.t()
        }

  @enforce_keys [:departures, :header]
  defstruct departures: nil,
            header: nil

  use ScreensConfig.Struct, children: [departures: Departures, header: CurrentStopName]
end
