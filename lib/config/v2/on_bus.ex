defmodule ScreensConfig.V2.OnBus do
  @moduledoc false

  alias ScreensConfig.V2.Header.BusId

  @type t :: %__MODULE__{
          bus_id: String.t(),
          evergreen_content: list(EvergreenContentItem.t())
        }

  @enforce_keys [
    :bus_id
  ]

  defstruct @enforce_keys ++
              [
                evergreen_content: []
              ]

  use ScreensConfig.Struct,
    children: [
      evergreen_content: {:list, EvergreenContentItem}
    ]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
