defmodule ScreensConfig.Screen.BusEink do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

  alias ScreensConfig.{Alerts, Departures, EvergreenContentItem, Footer, Header}

  @type t :: %__MODULE__{
          departures: Departures.t(),
          footer: Footer.t(),
          header: Header.t(),
          alerts: Alerts.t(),
          evergreen_content: list(EvergreenContentItem.t())
        }

  @enforce_keys [:departures, :footer, :header, :alerts]
  defstruct departures: nil,
            footer: nil,
            header: nil,
            alerts: nil,
            evergreen_content: []

  use ScreensConfig.Struct,
    children: [
      departures: Departures,
      footer: Footer,
      alerts: Alerts,
      evergreen_content: {:list, EvergreenContentItem}
    ]

  use Header
end
