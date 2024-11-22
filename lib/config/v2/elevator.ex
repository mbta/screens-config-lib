defmodule ScreensConfig.V2.Elevator do
  @moduledoc false

  alias ScreensConfig.Arrow
  alias ScreensConfig.V2.EvergreenContentItem

  @type t :: %__MODULE__{
          elevator_id: String.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          alternate_direction_text: String.t(),
          accessible_path_image_url: String.t(),
          accessible_path_direction_arrow: Arrow.t(),
          you_are_here_coordinates: %{x: non_neg_integer(), y: non_neg_integer()}
        }

  @enforce_keys [
    :elevator_id,
    :alternate_direction_text,
    :accessible_path_direction_arrow
  ]
  defstruct @enforce_keys ++
              [
                evergreen_content: [],
                accessible_path_image_url: nil,
                you_are_here_coordinates: %{x: 0, y: 0}
              ]

  use ScreensConfig.Struct,
    children: [
      evergreen_content: {:list, EvergreenContentItem}
    ]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
