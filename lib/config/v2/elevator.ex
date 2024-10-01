defmodule ScreensConfig.V2.Elevator do
  @moduledoc false

  alias ScreensConfig.V2.EvergreenContentItem

  @type t :: %__MODULE__{
          elevator_id: String.t(),
          evergreen_content: list(EvergreenContentItem.t())
        }

  @enforce_keys [:elevator_id]
  defstruct elevator_id: nil,
            evergreen_content: []

  use ScreensConfig.Struct,
    children: [
      evergreen_content: {:list, EvergreenContentItem}
    ]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
