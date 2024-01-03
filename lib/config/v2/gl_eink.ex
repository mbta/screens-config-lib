defmodule ScreensConfig.V2.GlEink do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

  alias ScreensConfig.V2.{
    Alerts,
    Audio,
    Departures,
    EvergreenContentItem,
    Footer,
    LineMap,
    PlatformLocation
  }

  alias ScreensConfig.V2.Header.Destination

  @type t :: %__MODULE__{
          departures: Departures.t(),
          footer: Footer.t(),
          header: Destination.t(),
          alerts: Alerts.t(),
          line_map: LineMap.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          audio: Audio.t(),
          platform_location: PlatformLocation
        }

  @enforce_keys [:departures, :footer, :header, :alerts, :line_map]
  defstruct departures: nil,
            footer: nil,
            header: nil,
            alerts: nil,
            line_map: nil,
            evergreen_content: [],
            audio: Audio.from_json(:default),
            platform_location: nil

  use ScreensConfig.Struct,
    children: [
      departures: Departures,
      footer: Footer,
      header: Destination,
      alerts: Alerts,
      line_map: LineMap,
      evergreen_content: {:list, EvergreenContentItem},
      audio: Audio,
      platform_location: PlatformLocation
    ]
end
