defmodule ScreensConfig.V2.LocalEvergreenSet do
  @moduledoc false

  alias ScreensConfig.V2.Schedule

  @type t :: %__MODULE__{
          folder_name: String.t(),
          schedule: list(Schedule.t())
        }

  @enforce_keys ~w[folder_name]a
  defstruct folder_name: nil,
            schedule: [%Schedule{}]

  use ScreensConfig.Struct, children: [schedule: {:list, Schedule}]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
