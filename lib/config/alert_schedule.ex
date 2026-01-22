defmodule ScreensConfig.AlertSchedule do
  @moduledoc false

  @type t :: %__MODULE__{
          alert_ids: [String.t()],
          suppress_alert_widgets: boolean()
        }

  defstruct alert_ids: [], suppress_alert_widgets: true

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
