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

  alias ScreensConfig.V2.{Audio, Departures, EvergreenContentItem}
  alias ScreensConfig.V2.Header.CurrentStopName

  @type t :: %__MODULE__{
          audio: Audio.t(),
          departures: Departures.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          header: CurrentStopName.t()
        }

  @enforce_keys [:departures, :header]
  defstruct audio: %Audio{
              start_time: ~T[00:00:00],
              stop_time: ~T[23:59:59],
              days_active: [1, 2, 3, 4, 5, 6, 7]
            },
            departures: nil,
            evergreen_content: [],
            header: nil

  use ScreensConfig.Struct,
    children: [
      audio: Audio,
      departures: Departures,
      evergreen_content: {:list, EvergreenContentItem},
      header: CurrentStopName
    ]
end
