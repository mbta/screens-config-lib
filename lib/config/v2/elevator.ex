defmodule ScreensConfig.V2.Elevator do
  @moduledoc false

  alias ScreensConfig.V2.EvergreenContentItem

  @type arrow_direction :: :n | :s | :e | :w

  @type t :: %__MODULE__{
          elevator_id: String.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          alternate_direction_text: String.t(),
          accessible_path_image_url: String.t(),
          accessible_path_direction_arrow: arrow_direction()
        }

  @enforce_keys [
    :elevator_id,
    :alternate_direction_text,
    :accessible_path_image_url,
    :accessible_path_direction_arrow
  ]
  defstruct @enforce_keys ++ [evergreen_content: []]

  use ScreensConfig.Struct,
    children: [
      evergreen_content: {:list, EvergreenContentItem}
    ]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
