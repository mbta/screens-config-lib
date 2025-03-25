defmodule ScreensConfig.Screen.OnBus do
  @moduledoc false

  alias ScreensConfig.EvergreenContentItem

  @type t :: %__MODULE__{
          evergreen_content: list(EvergreenContentItem.t())
        }

  defstruct evergreen_content: []

  use ScreensConfig.Struct,
    children: [
      evergreen_content: {:list, EvergreenContentItem}
    ]
end
