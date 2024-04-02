defmodule ScreensConfig.V2.Busway do
  @moduledoc """
  Configures "busway"-type screens.

  The representative use case is a large color screen with audio readout capability, at or near
  ground level, a short distance from multiple distinct stopping locations (such as a busway and
  a subway platform) which may be served by many different routes.

  Can be thought of as a variant of `BusShelter` screens which drops the "flex zone" that would
  normally display alerts and evergreen content, and instead uses the space for extra departures,
  typically split into multiple sections.
  """

  alias ScreensConfig.V2.{Departures, EvergreenContentItem}
  alias ScreensConfig.V2.Header.CurrentStopName

  @type t :: %__MODULE__{
          departures: Departures.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          header: CurrentStopName.t()
        }

  @enforce_keys [:departures, :header]
  defstruct departures: nil,
            evergreen_content: [],
            header: nil

  use ScreensConfig.Struct,
    children: [
      departures: Departures,
      evergreen_content: {:list, EvergreenContentItem},
      header: CurrentStopName
    ]
end
