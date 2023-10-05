defmodule ScreensConfig.V2.BusEink do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

  alias ScreensConfig.V2.{Alerts, Departures, EvergreenContentItem, Footer}
  alias ScreensConfig.V2.Header.CurrentStopId

  @type t :: %__MODULE__{
          departures: Departures.t(),
          footer: Footer.t(),
          header: CurrentStopId.t(),
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
      header: CurrentStopId,
      alerts: Alerts,
      evergreen_content: {:list, EvergreenContentItem}
    ]
end
