defmodule ScreensConfig.V2.Triptych do
  @moduledoc false

  alias ScreensConfig.V2.{EvergreenContentItem, LocalEvergreenSet, TrainCrowding}
  alias ScreensConfig.V2.Header.CurrentStopId

  @type t :: %__MODULE__{
          train_crowding: TrainCrowding.t(),
          local_evergreen_sets: list(LocalEvergreenSet.t()),
          evergreen_content: list(EvergreenContentItem.t()),
          show_identifiers: boolean(),
          reconstructed_alert_widget: CurrentStopId.t()
        }

  @enforce_keys [:train_crowding, :local_evergreen_sets]
  defstruct train_crowding: nil,
            local_evergreen_sets: [],
            evergreen_content: [],
            show_identifiers: false,
            reconstructed_alert_widget: nil

  use ScreensConfig.Struct,
    children: [
      train_crowding: TrainCrowding,
      local_evergreen_sets: {:list, LocalEvergreenSet},
      evergreen_content: {:list, EvergreenContentItem},
      reconstructed_alert_widget: CurrentStopId
    ]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
