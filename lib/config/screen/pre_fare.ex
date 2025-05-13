defmodule ScreensConfig.Screen.PreFare do
  @moduledoc false

  alias ScreensConfig.{
    Alerts,
    ContentSummary,
    CRDepartures,
    Departures,
    ElevatorStatus,
    EvergreenContentItem,
    FullLineMap,
    Header,
    ShuttleBusInfo
  }

  @type t :: %__MODULE__{
          template: :duo | :solo,
          header: Header.t(),
          reconstructed_alert_widget: Alerts.t(),
          elevator_status: ElevatorStatus.t(),
          full_line_map: list(FullLineMap.t()),
          evergreen_content: list(EvergreenContentItem.t()),
          content_summary: ContentSummary.t(),
          cr_departures: CRDepartures.t(),
          shuttle_bus_info: ShuttleBusInfo.t(),
          departures: Departures.t() | nil
        }

  @enforce_keys [
    :header,
    :reconstructed_alert_widget,
    :elevator_status,
    :full_line_map,
    :content_summary
  ]
  defstruct template: :duo,
            header: nil,
            reconstructed_alert_widget: nil,
            elevator_status: nil,
            full_line_map: [],
            evergreen_content: [],
            content_summary: nil,
            cr_departures: CRDepartures.from_json(:default),
            shuttle_bus_info: ShuttleBusInfo.from_json(:default),
            departures: nil

  use ScreensConfig.Struct,
    children: [
      elevator_status: ElevatorStatus,
      full_line_map: {:list, FullLineMap},
      evergreen_content: {:list, EvergreenContentItem},
      reconstructed_alert_widget: Alerts,
      content_summary: ContentSummary,
      cr_departures: CRDepartures,
      shuttle_bus_info: ShuttleBusInfo,
      departures: Departures
    ]

  use Header

  defp value_from_json("template", "duo"), do: :duo
  defp value_from_json("template", "solo"), do: :solo
  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
