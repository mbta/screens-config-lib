defmodule ScreensConfig.V2.LineMap do
  @moduledoc false

  @type t :: %__MODULE__{
          stop_id: String.t(),
          station_id: String.t(),
          direction_id: 0 | 1,
          route_id: String.t()
        }

  @enforce_keys [:stop_id, :station_id, :direction_id, :route_id]
  defstruct stop_id: nil,
            station_id: nil,
            direction_id: nil,
            route_id: nil

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
