defmodule ScreensConfig.Departures.Section do
  @moduledoc """
  Configures a section within the Departures widget. Sections are a means of grouping departures
  by mode, stopping location, etc. Each section can fetch and display its departures differently.

  - `bidirectional` enables a filter which enforces a maximum of 2 departures: the first that
    would normally be displayed, and the next one in the opposite direction, if there is one.
  """

  alias ScreensConfig.Departures.{Filters, Header, Layout, Params}

  @type t :: %__MODULE__{
          params: Params.t() | nil,
          filters: Filters.t(),
          header: Header.t(),
          layout: Layout.t(),
          bidirectional: boolean(),
          grouping_type: :time | :destination
        }

  @enforce_keys [:params]
  defstruct params: nil,
            filters: Filters.from_json(:default),
            header: Header.from_json(:default),
            layout: Layout.from_json(:default),
            bidirectional: false,
            grouping_type: :time

  use ScreensConfig.Struct,
    children: [params: Params, header: Header, filters: Filters, layout: Layout]

  # Migrate from format where `params` was nested under a `query` field
  defp migrate_json(%{"query" => %{"params" => params}} = json),
    do: Map.put(json, "params", params)

  defp migrate_json(%{"query" => nil} = json), do: Map.put(json, "params", nil)

  defp migrate_json(other), do: other

  defp value_from_json("grouping_type", "time"), do: :time
  defp value_from_json("grouping_type", "destination"), do: :destination

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
