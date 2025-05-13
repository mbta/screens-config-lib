defmodule ScreensConfig.Screen.Dup do
  @moduledoc false

  alias ScreensConfig.{Alerts, Departures, EvergreenContentItem, Header}

  @type t :: %__MODULE__{
          header: Header.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          primary_departures: Departures.t(),
          secondary_departures: Departures.t(),
          alerts: Alerts.t()
        }

  @enforce_keys [:header, :primary_departures, :secondary_departures, :alerts]
  defstruct @enforce_keys ++ [evergreen_content: []]

  use ScreensConfig.Struct,
    children: [
      primary_departures: Departures,
      secondary_departures: Departures,
      alerts: Alerts,
      evergreen_content: {:list, EvergreenContentItem}
    ]

  use Header
end
