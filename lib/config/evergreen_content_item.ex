defmodule ScreensConfig.EvergreenContentItem do
  @moduledoc false

  alias ScreensConfig.{AlertSchedule, RecurrentSchedule, Schedule, WidgetInstance}

  @type t :: %__MODULE__{
          slot_names: list(WidgetInstance.slot_id()),
          asset_path: String.t(),
          priority: WidgetInstance.priority(),
          schedule: list(Schedule.t()) | RecurrentSchedule.t() | AlertSchedule.t(),
          text_for_audio: String.t(),
          audio_priority: WidgetInstance.priority()
        }

  @enforce_keys ~w[slot_names asset_path priority]a
  defstruct slot_names: nil,
            asset_path: nil,
            priority: nil,
            schedule: [%Schedule{}],
            text_for_audio: nil,
            audio_priority: nil

  use ScreensConfig.Struct

  defp value_from_json("schedule", datetime_periods) when is_list(datetime_periods) do
    Enum.map(datetime_periods, &Schedule.from_json/1)
  end

  defp value_from_json("schedule", %{"dates" => _, "times" => _} = dates_and_times) do
    RecurrentSchedule.from_json(dates_and_times)
  end

  defp value_from_json("schedule", %{"alert_ids" => _} = alert_schedule) do
    AlertSchedule.from_json(alert_schedule)
  end

  defp value_from_json(_, value), do: value

  defp value_to_json(:schedule, datetime_periods) when is_list(datetime_periods) do
    Enum.map(datetime_periods, &Schedule.to_json/1)
  end

  defp value_to_json(:schedule, %struct{} = schedule), do: struct.to_json(schedule)

  defp value_to_json(_, value), do: value
end
