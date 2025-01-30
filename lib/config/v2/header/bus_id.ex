defmodule ScreensConfig.V2.Header.BusId do
  @moduledoc false

  @type t :: %__MODULE__{bus_id: String.t()}

  @enforce_keys [:bus_id]
  defstruct bus_id: nil

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
