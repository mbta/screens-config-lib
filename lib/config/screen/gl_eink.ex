defmodule ScreensConfig.Screen.GlEink do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

  alias ScreensConfig.{Alerts, Departures, EvergreenContentItem, Footer, LineMap}
  alias ScreensConfig.Header.Destination

  @type t :: %__MODULE__{
          departures: Departures.t(),
          footer: Footer.t(),
          header: Destination.t(),
          alerts: Alerts.t(),
          line_map: LineMap.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          platform_location: :front | :back | nil
        }

  @enforce_keys [:departures, :footer, :header, :alerts, :line_map]
  defstruct departures: nil,
            footer: nil,
            header: nil,
            alerts: nil,
            line_map: nil,
            evergreen_content: [],
            platform_location: nil

  use ScreensConfig.Struct,
    children: [
      departures: Departures,
      footer: Footer,
      header: Destination,
      alerts: Alerts,
      line_map: LineMap,
      evergreen_content: {:list, EvergreenContentItem}
    ]

  defp value_from_json("platform_location", location) do
    case location do
      "front" -> :front
      "back" -> :back
      _ -> nil
    end
  end

  defp value_to_json(_, value), do: value
end
