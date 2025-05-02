defmodule ScreensConfig.Departures.Section do
  @moduledoc """
  Configures a section within the Departures widget. Sections are a means of grouping departures
  by mode, stopping location, etc. Each section can fetch and display its departures differently.

  - `bidirectional` enables a filter which enforces a maximum of 2 departures: the first that
    would normally be displayed, and the next one in the opposite direction, if there is one.
  - `header_only, when true, disables fetching of departures so that only the header + subheader
    of the section are shown. Defaults to false.
  """

  alias ScreensConfig.Departures.{Filters, Header, Layout, Query}

  @type t :: %__MODULE__{
          query: Query.t(),
          filters: Filters.t(),
          header: Header.t(),
          layout: Layout.t(),
          bidirectional: boolean(),
          header_only: boolean()
        }

  @enforce_keys [:query]
  defstruct query: nil,
            filters: Filters.from_json(:default),
            header: Header.from_json(:default),
            layout: Layout.from_json(:default),
            bidirectional: false,
            header_only: false

  use ScreensConfig.Struct,
    children: [query: Query, header: Header, filters: Filters, layout: Layout]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
