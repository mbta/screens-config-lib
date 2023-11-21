defmodule ScreensConfig.V2.NewSchedule do
  @moduledoc false

  @type date_range :: %{start_date: Date.t() | nil, end_date: Date.t() | nil}
  @type time_range :: %{start_time_utc: Time.t(), end_time_utc: Time.t()}

  @type t :: %__MODULE__{
          dates: list(date_range()),
          times: list(time_range())
        }

  defstruct dates: [],
            times: []

  use ScreensConfig.Struct

  defp value_from_json("dates", dates_list) when is_list(dates_list) do
    Enum.map(dates_list, fn
      %{"start_date" => nil, "end_date" => end_date} ->
        %{start_date: nil, end_date: Date.from_iso8601!(end_date)}

      %{"start_date" => start_date, "end_date" => nil} ->
        %{start_date: Date.from_iso8601!(start_date), end_date: nil}

      %{"start_date" => start_date, "end_date" => end_date} ->
        %{start_date: Date.from_iso8601!(start_date), end_date: Date.from_iso8601!(end_date)}
    end)
  end

  defp value_from_json("times", times_list) when is_list(times_list) do
    Enum.map(times_list, fn %{"start_time_utc" => start_time_utc, "end_time_utc" => end_time_utc} ->
      %{
        start_time_utc: Time.from_iso8601!(start_time_utc),
        end_time_utc: Time.from_iso8601!(end_time_utc)
      }
    end)
  end

  defp value_from_json(_, value), do: value

  defp value_to_json(:dates, dates_list) do
    Enum.map(dates_list, fn dates_map ->
      Map.new(dates_map, fn
        {k, nil} -> {k, nil}
        {k, date} -> {k, Date.to_iso8601(date)}
      end)
    end)
  end

  defp value_to_json(:times, times_list) do
    Enum.map(times_list, fn time_period ->
      %{
        start_time_utc: Time.to_iso8601(time_period.start_time_utc),
        end_time_utc: Time.to_iso8601(time_period.end_time_utc)
      }
    end)
  end

  defp value_to_json(_, value), do: value
end
