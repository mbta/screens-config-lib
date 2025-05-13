defmodule ScreensConfig.Header.Destination do
  @moduledoc """
  Header type for screens installed at a stop that serves a single specific route and direction
  (canonically, a Green Line branch platform), where the header should indicate the destination
  of vehicles that stop there.
  """

  @type t :: %__MODULE__{route_id: String.t(), direction_id: 0 | 1}

  @enforce_keys [:route_id, :direction_id]
  defstruct @enforce_keys

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
