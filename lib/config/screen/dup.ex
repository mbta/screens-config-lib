defmodule ScreensConfig.Screen.Dup do
  @moduledoc false

  alias ScreensConfig.{Alerts, Departures, EvergreenContentItem, Header.InOut}

  @type t :: %__MODULE__{
          header: Header.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          primary_departures: Departures.t(),
          secondary_departures: Departures.t(),
          alerts: Alerts.t(),
          in_out: InOut.t()
        }

  @enforce_keys [:header, :primary_departures, :secondary_departures, :alerts]
  defstruct @enforce_keys ++ [evergreen_content: [], in_out: nil]

  use ScreensConfig.Struct,
    children: [
      primary_departures: Departures,
      secondary_departures: Departures,
      alerts: Alerts,
      evergreen_content: {:list, EvergreenContentItem},
      in_out: InOut
    ]

  use Header
end
