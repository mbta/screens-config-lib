defmodule ScreensConfig.ShuttleBusInfo do
  @moduledoc false

  alias ScreensConfig.Arrow
  alias ScreensConfig.{ShuttleBusSchedule, WidgetInstance}

  @type t :: %__MODULE__{
          minutes_range_to_destination_schedule: list(ShuttleBusSchedule.t()),
          destination: String.t(),
          arrow: Arrow.t(),
          english_boarding_instructions: String.t(),
          spanish_boarding_instructions: String.t(),
          audio_boarding_instructions: String.t(),
          priority: WidgetInstance.priority(),
          enabled: boolean()
        }

  defstruct minutes_range_to_destination_schedule: [],
            destination: nil,
            arrow: nil,
            english_boarding_instructions: nil,
            spanish_boarding_instructions: nil,
            audio_boarding_instructions: nil,
            priority: [99],
            enabled: false

  use ScreensConfig.Struct,
    children: [minutes_range_to_destination_schedule: {:list, ShuttleBusSchedule}],
    with_default: true

  for arrow <- ~w[n ne e se s sw w nw]a do
    arrow_string = Atom.to_string(arrow)
    defp value_from_json("arrow", unquote(arrow_string)), do: unquote(arrow)
  end

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
