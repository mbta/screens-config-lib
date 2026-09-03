defmodule ScreensConfig.MultiStopAlerts do
  @moduledoc "Configuration for screens that can show alerts for multiple stops."

  @type t :: %__MODULE__{stop_ids: [String.t()]}

  defstruct stop_ids: []

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
