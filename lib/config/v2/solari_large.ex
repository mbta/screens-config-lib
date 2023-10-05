defmodule ScreensConfig.V2.SolariLarge do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

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
