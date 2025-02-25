defmodule ScreensConfig.V2.PreFare do
  @moduledoc false

  alias ScreensConfig.V2.{
    ContentSummary,
    CRDepartures,
    ElevatorStatus,
    EvergreenContentItem,
    FullLineMap,
    ShuttleBusInfo
  }

  alias ScreensConfig.V2.Header.CurrentStopId

  @type t :: %__MODULE__{
          template: :duo | :solo,
          header: CurrentStopId.t(),
          reconstructed_alert_widget: CurrentStopId.t(),
          elevator_status: ElevatorStatus.t(),
          full_line_map: list(FullLineMap.t()),
          evergreen_content: list(EvergreenContentItem.t()),
          content_summary: ContentSummary.t(),
          cr_departures: CRDepartures.t(),
          shuttle_bus_info: ShuttleBusInfo.t()
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
            shuttle_bus_info: ShuttleBusInfo.from_json(:default)

  use ScreensConfig.Struct,
    children: [
      header: CurrentStopId,
      elevator_status: ElevatorStatus,
      full_line_map: {:list, FullLineMap},
      evergreen_content: {:list, EvergreenContentItem},
      reconstructed_alert_widget: CurrentStopId,
      content_summary: ContentSummary,
      cr_departures: CRDepartures,
      shuttle_bus_info: ShuttleBusInfo
    ]

  defp value_from_json("template", "duo"), do: :duo
  defp value_from_json("template", "solo"), do: :solo

  defp value_to_json(_, value), do: value
end
