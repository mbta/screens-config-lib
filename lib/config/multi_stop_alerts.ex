defmodule ScreensConfig.MultiStopAlerts do
  @moduledoc "Configuration for screens that can show alerts for multiple stops."

  @type t :: %__MODULE__{stop_ids: [String.t()]}

  defstruct stop_ids: []

  use ScreensConfig.Struct

  # Allow migrating from `ScreensConfig.Alerts` which has a singular `stop_id`.
  defp migrate_json(%{"stop_id" => stop_id} = json) when not is_nil(stop_id),
    do: Map.put(json, "stop_ids", [stop_id])

  defp migrate_json(other), do: other

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
