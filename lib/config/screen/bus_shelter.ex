defmodule ScreensConfig.Screen.BusShelter do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

  alias ScreensConfig.{Alerts, Audio, Departures, EvergreenContentItem, Footer, Header, Survey}

  @type t :: %__MODULE__{
          departures: Departures.t(),
          footer: Footer.t(),
          header: Header.t(),
          alerts: Alerts.t(),
          evergreen_content: list(EvergreenContentItem.t()),
          survey: Survey.t(),
          audio: Audio.t()
        }

  @enforce_keys [:departures, :footer, :header, :alerts]
  defstruct departures: nil,
            footer: nil,
            header: nil,
            alerts: nil,
            evergreen_content: [],
            survey: Survey.from_json(:default),
            audio: Audio.from_json(:default)

  use ScreensConfig.Struct,
    children: [
      departures: Departures,
      footer: Footer,
      alerts: Alerts,
      evergreen_content: {:list, EvergreenContentItem},
      survey: Survey,
      audio: Audio
    ]

  use Header
end
