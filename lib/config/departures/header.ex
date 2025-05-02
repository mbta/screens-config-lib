defmodule ScreensConfig.Departures.Header do
  @moduledoc """
  Configures the header of a `Section`.

  - `title` is the displayed title of the section.
  - `arrow` is the direction of an arrow displayed in the header, for wayfinding. This uses 8-way
    compass directions where "n" is towards the top of the display.
  - `read_as` is how the section should be announced in audio readouts. If `nil`, defaults to the
    configured `title`.
  - `subtitle` is a String that sets a subheading, initially intended for wayfinding directions,
    but usable for other types of subheadings. If `nil`, defaults to not including the subheading.

  If `title` is not set, there is no visual header, but `read_as` is still read out, if set.
  """

  alias ScreensConfig.Arrow

  @type t :: %__MODULE__{
          arrow: Arrow.t(),
          read_as: String.t() | nil,
          title: String.t() | nil,
          subtitle: String.t() | nil
        }

  defstruct [:arrow, :read_as, :title, :subtitle]

  use ScreensConfig.Struct, with_default: true

  defp value_from_json("arrow", value) when value in ~w(n ne e se s sw w nw),
    do: String.to_existing_atom(value)

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
