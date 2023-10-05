defmodule ScreensConfig.V2.Alerts do
  @moduledoc false

  @type t :: %__MODULE__{stop_id: String.t()}

  @enforce_keys [:stop_id]
  defstruct @enforce_keys

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
