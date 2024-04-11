defmodule ScreensConfig.V2.Departures.Section do
  @moduledoc """
  Configures a section within the Departures widget. Sections are a means of grouping departures
  by mode, stopping location, etc. Each section can fetch and display its departures differently.

  - `bidirectional` enables a special mode that displays exactly two departures: the first one
    that would normally be displayed, and the next departure on the same route in the opposite
    direction.
  """

  alias ScreensConfig.V2.Departures.{Filters, Header, Headway, Layout, Query}

  @type t :: %__MODULE__{
          query: Query.t(),
          filters: Filters.t(),
          header: Header.t(),
          headway: Headway.t(),
          layout: Layout.t(),
          bidirectional: boolean()
        }

  @enforce_keys [:query]
  defstruct query: nil,
            filters: Filters.from_json(:default),
            header: Header.from_json(:default),
            headway: Headway.from_json(:default),
            layout: Layout.from_json(:default),
            bidirectional: false

  use ScreensConfig.Struct,
    children: [query: Query, header: Header, filters: Filters, headway: Headway, layout: Layout]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
