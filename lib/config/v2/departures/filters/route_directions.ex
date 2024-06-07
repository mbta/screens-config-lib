defmodule ScreensConfig.V2.Departures.Filters.RouteDirections do
  @moduledoc false

  defmodule RouteDirection do
    @moduledoc false

    @type t :: %__MODULE__{direction_id: 0 | 1 | nil, route_id: String.t()}

    @enforce_keys [:route_id]
    defstruct direction_id: nil, route_id: nil

    use ScreensConfig.Struct

    defp value_from_json(_, value), do: value
    defp value_to_json(_, value), do: value
  end

  @type t :: %__MODULE__{action: :include | :exclude, targets: list(RouteDirection.t())}

  @enforce_keys [:action, :targets]
  defstruct action: nil, targets: []

  use ScreensConfig.Struct, children: [targets: {:list, RouteDirection}]

  defp value_from_json("action", "include"), do: :include
  defp value_from_json("action", "exclude"), do: :exclude

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
