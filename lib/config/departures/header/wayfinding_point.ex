defmodule ScreensConfig.Departures.Header.WayfindingPoint do
  @moduledoc """
  Configures a Wayfinding Dot on top of the Header Image.

  - `x_position` is the x coordinate position in pixels from the left
  - `y_position` is the y coordinate position in pixels from the top
  - `beam_angle` is the angle in degrees we want to rotate
    the directional beam from its starting position of up (0 degrees).
    Can be negative degrees as well e.g. -45, -90
  """

  @type t :: %__MODULE__{
          x_position: non_neg_integer(),
          y_position: non_neg_integer(),
          beam_angle: integer() | nil
        }

  @enforce_keys [:x_position, :y_position]
  defstruct @enforce_keys ++ [:beam_angle]

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
