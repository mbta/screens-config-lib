defmodule ScreensConfig.Screen.Dup do
  @moduledoc false

  alias ScreensConfig.{
    Alerts,
    Departures,
    EmergencyMessagingLocation,
    EvergreenContentItem,
    Header
  }

  @type t :: %__MODULE__{
          header: Header.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          primary_departures: Departures.t(),
          secondary_departures: Departures.t(),
          alerts: Alerts.t(),
          emergency_messaging_location: EmergencyMessagingLocation.t()
        }

  @enforce_keys [:header, :primary_departures, :secondary_departures, :alerts]
  defstruct @enforce_keys ++ [emergency_messaging_location: nil, evergreen_content: []]

  use ScreensConfig.Struct,
    children: [
      primary_departures: Departures,
      secondary_departures: Departures,
      alerts: Alerts,
      evergreen_content: {:list, EvergreenContentItem}
    ]

  use Header

  defp value_from_json("emergency_messaging_location", value),
    do: EmergencyMessagingLocation.from_json(value)

  defp value_to_json(_, value), do: value
end
