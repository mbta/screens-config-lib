defmodule ScreensConfig.Screen.Busway do
  @moduledoc """
  Configures "busway"-type screens.

  The representative use case is a large color screen with audio readout capability, at or near
  ground level, a short distance from multiple distinct stopping locations (such as a busway and
  a subway platform) which may be served by many different routes.

  Can be thought of as a variant of `BusShelter` screens which drops the "flex zone" that would
  normally display alerts and evergreen content, and instead uses the space for extra departures,
  typically split into multiple sections.
  """

  alias ScreensConfig.{Departures, EvergreenContentItem}
  alias ScreensConfig.Header

  @type t :: %__MODULE__{
          departures: Departures.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          header: Header.t(),
          include_logo_in_header: boolean()
        }

  @enforce_keys [:departures, :header]
  defstruct departures: nil, evergreen_content: [], header: nil, include_logo_in_header: false

  use ScreensConfig.Struct,
    children: [
      departures: Departures,
      evergreen_content: {:list, EvergreenContentItem}
    ]

  use Header

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
