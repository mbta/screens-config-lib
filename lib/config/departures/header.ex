defmodule ScreensConfig.Departures.Header do
  @moduledoc """
  Configures the header of a `Section`. All elements of a header are optional and can be omitted
  by setting them to `nil`.

  - `title` is the displayed title of the section.
  - `arrow` is the direction of a wayfinding arrow displayed alongside the title. This uses 8-way
    compass directions where "n" is towards the top of the display.
  - `subtitle` is an additional text element with less visual prominence, primarily intended for
    wayfinding directions.
  - `read_as` is how the section should be announced in audio readouts. If `nil`, defaults to the
    configured `title` plus `subtitle`. This applies even if the header has no visual components.
  - `wayfinding_information` encapsulates additional wayfinding information to be shown and
    spoken to riders.
  """

  alias __MODULE__.WayfindingInformation
  alias ScreensConfig.Arrow

  @type t :: %__MODULE__{
          arrow: Arrow.t(),
          read_as: String.t() | nil,
          subtitle: String.t() | nil,
          title: String.t() | nil,
          wayfinding_information: WayfindingInformation.t() | nil
        }

  defstruct [:arrow, :read_as, :subtitle, :title, :wayfinding_information]

  use ScreensConfig.Struct,
    children: [wayfinding_information: WayfindingInformation],
    with_default: true

  defp value_from_json("arrow", value), do: Arrow.from_json(value)
  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
