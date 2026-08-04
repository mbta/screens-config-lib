defmodule ScreensConfig.Departures.Filters do
  @moduledoc """
  Configures filtering for the departures displayed in a `Section`.

  - `route_directions` limits departures based on specific combinations of route and direction.
  """

  alias ScreensConfig.Departures.Filters.RouteDirections

  @type t :: %__MODULE__{
          route_directions: RouteDirections.t() | nil
        }

  defstruct route_directions: nil

  use ScreensConfig.Struct, children: [route_directions: RouteDirections], with_default: true

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
