defmodule ScreensConfig.V2.ReconstructedAlert do
  @moduledoc false

  alias ScreensConfig.V2.Header.CurrentStopId

  @type t :: %__MODULE__{
          parent_station_id: CurrentStopId.t(),
          pair_takeover_with_cr_widget: boolean()
        }

  @enforce_keys [:parent_station_id]
  defstruct parent_station_id: nil,
            pair_takeover_with_cr_widget: false

  use ScreensConfig.Struct, children: [parent_station_id: CurrentStopId]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
