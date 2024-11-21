defmodule ScreensConfig.V2.BlueBikes.Station do
  @moduledoc false

  alias ScreensConfig.Arrow

  @type t :: %__MODULE__{
          id: String.t(),
          arrow: Arrow.t(),
          walk_distance_minutes: non_neg_integer(),
          walk_distance_feet: non_neg_integer()
        }

  @enforce_keys [:id, :arrow, :walk_distance_minutes, :walk_distance_feet]
  defstruct @enforce_keys

  use ScreensConfig.Struct

  for arrow <- ~w[n ne e se s sw w nw]a do
    arrow_string = Atom.to_string(arrow)
    defp value_from_json("arrow", unquote(arrow_string)), do: unquote(arrow)
  end

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
