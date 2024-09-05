defmodule ScreensConfig.V2.GlEink do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

  alias ScreensConfig.V2.{Alerts, Audio, Departures, EvergreenContentItem, Footer, LineMap}
  alias ScreensConfig.V2.Header.Destination

  @type t :: %__MODULE__{
          departures: Departures.t(),
          footer: Footer.t(),
          header: Destination.t(),
          alerts: Alerts.t(),
          line_map: LineMap.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          audio: Audio.t(),
          platform_location: :front | :back | nil
        }

  @enforce_keys [:departures, :footer, :header, :alerts, :line_map]
  defstruct departures: nil,
            footer: nil,
            header: nil,
            alerts: nil,
            line_map: nil,
            evergreen_content: [],
            audio: Audio.always(),
            platform_location: nil

  use ScreensConfig.Struct,
    children: [
      departures: Departures,
      footer: Footer,
      header: Destination,
      alerts: Alerts,
      line_map: LineMap,
      evergreen_content: {:list, EvergreenContentItem},
      audio: Audio
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
