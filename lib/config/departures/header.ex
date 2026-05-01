defmodule ScreensConfig.Departures.Header do
  @moduledoc """
  Configures the header of a `Section`. All elements of a header are optional and can be omitted
  by setting them to `nil`.

  - `title` is the displayed title of the section.
  - `arrow` is the direction of a wayfinding arrow displayed alongside the title. This uses 8-way
    compass directions where "n" is towards the top of the display.
  - `image_path` is the path of an image displayed below the title (if present).
  - `wayfinding_point` in combination with `image_path` allows for a breathing
    blue location dot and an optional directional fan to be shown on the image.
    `image_path` will need to be configured in order for `wayfinding_point` to display as well.
  - `subtitle` is an additional text element with less visual prominence, primarily intended for
    wayfinding directions.
  - `read_as` is how the section should be announced in audio readouts. If `nil`, defaults to the
    configured `title` plus `subtitle`. This applies even if the header has no visual components.
  """

  alias __MODULE__.WayfindingPoint
  alias ScreensConfig.Arrow

  @type t :: %__MODULE__{
          arrow: Arrow.t(),
          image_path: String.t() | nil,
          read_as: String.t() | nil,
          subtitle: String.t() | nil,
          title: String.t() | nil,
          wayfinding_point: WayfindingPoint.t() | nil
        }

  defstruct [:arrow, :image_path, :read_as, :subtitle, :title, :wayfinding_point]

  use ScreensConfig.Struct, children: [wayfinding_point: WayfindingPoint], with_default: true

  defp value_from_json("arrow", value), do: Arrow.from_json(value)
  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
