defmodule ScreensConfig.Screen.Dup do
  @moduledoc false

  alias ScreensConfig.{
    Alerts,
    Departures,
    EmergencyMessagingLocation,
    EmergencyTakeover,
    EvergreenContentItem,
    Header
  }

  @type t :: %__MODULE__{
          header: Header.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          primary_departures: Departures.t(),
          secondary_departures: Departures.t(),
          alerts: Alerts.t(),
          emergency_messaging_location: EmergencyMessagingLocation.t(),
          emergency_takeover: EmergencyTakeover.t() | nil
        }

  @enforce_keys [:header, :primary_departures, :secondary_departures, :alerts]
  defstruct @enforce_keys ++
              [emergency_messaging_location: nil, evergreen_content: [], emergency_takeover: nil]

  use ScreensConfig.Struct,
    children: [
      primary_departures: Departures,
      secondary_departures: Departures,
      alerts: Alerts,
      evergreen_content: {:list, EvergreenContentItem},
      emergency_takeover: EmergencyTakeover
    ]

  use Header

  defp value_from_json("emergency_messaging_location", value),
    do: EmergencyMessagingLocation.from_json(value)

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
