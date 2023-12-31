defmodule ScreensConfig.V2.TrainCrowding do
  @moduledoc false

  @type t :: %__MODULE__{
          station_id: String.t(),
          route_id: String.t(),
          direction_id: 0 | 1,
          # Describes where the "you are here" arrow should be positioned.
          # 1: leftmost, 25: rightmost
          platform_position: 1..25,
          front_car_direction: :left | :right,
          enabled: boolean()
        }

  @enforce_keys [:station_id, :direction_id, :platform_position, :front_car_direction]
  defstruct station_id: nil,
            route_id: "Orange",
            direction_id: nil,
            platform_position: nil,
            front_car_direction: nil,
            enabled: false

  use ScreensConfig.Struct

  defp value_from_json("front_car_direction", "left"), do: :left
  defp value_from_json("front_car_direction", "right"), do: :right
  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
