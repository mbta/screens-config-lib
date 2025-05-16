defmodule ScreensConfig.Screen.BusEink do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

  alias ScreensConfig.{Departures, EvergreenContentItem, Footer, Header, MultiStopAlerts}

  @type t :: %__MODULE__{
          departures: Departures.t(),
          footer: Footer.t(),
          header: Header.t(),
          alerts: MultiStopAlerts.t(),
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
      alerts: MultiStopAlerts,
      evergreen_content: {:list, EvergreenContentItem}
    ]

  use Header
end
