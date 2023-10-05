defmodule ScreensConfig.V2.Departures.Filter do
  @moduledoc false

  alias ScreensConfig.V2.Departures.Filter.RouteDirection

  @type t :: %__MODULE__{
          action: :include | :exclude,
          route_directions: list(RouteDirection.t())
        }

  @enforce_keys [:action]
  defstruct action: nil,
            route_directions: []

  use ScreensConfig.Struct, children: [route_directions: {:list, RouteDirection}]

  defp value_from_json("action", "include"), do: :include
  defp value_from_json("action", "exclude"), do: :exclude

  defp value_to_json(_, value), do: value
end
