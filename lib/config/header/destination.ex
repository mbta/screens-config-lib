defmodule ScreensConfig.Header.Destination do
  @moduledoc false

  @type t :: %__MODULE__{route_id: String.t(), direction_id: 0 | 1}

  @enforce_keys [:route_id, :direction_id]
  defstruct route_id: nil,
            direction_id: nil

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
