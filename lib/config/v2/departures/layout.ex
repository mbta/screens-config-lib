defmodule ScreensConfig.V2.Departures.Layout do
  @moduledoc """
  Configures the visual layout of a `Section`.

  Conceptually, sections have a `base` size, which is how many departures they should ideally
  display; a `max` size, which is the most they should display if extra space allows them to
  grow; and a `min` size, which is the fewest they should display if space constraints require
  them to shrink. The layout algorithm will try to respect the `base` of all sections, treating
  `max` and `min` as hard limits.

  If `max` is not set, the section may grow to fill all available space. If `base` is not set, it
  defaults to the value of `max`.

  If `include_later` is set, the section includes a paging "Later Departures" component, which
  shows departures that would have otherwise been dropped due to space constraints (plus as many
  further-out departures as it has space for). The other fields do not "count" departures shown
  here; in other words, a section with `%{base: 4, max: 6, include_later: true}` is treated as
  desiring 4-6 departures that are visible at all times, and if more are available, however many
  will fit in "Later Departures" in addition to that.
  """

  @type t :: %__MODULE__{
          base: pos_integer() | nil,
          include_later: boolean(),
          max: pos_integer() | nil,
          min: pos_integer()
        }

  defstruct base: nil, include_later: false, max: nil, min: 1

  use ScreensConfig.Struct, with_default: true

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
