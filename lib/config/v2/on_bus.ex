defmodule ScreensConfig.V2.OnBus do
  @moduledoc false

  alias ScreensConfig.V2.EvergreenContentItem

  @type t :: %__MODULE__{
          evergreen_content: list(EvergreenContentItem.t())
        }

  defstruct evergreen_content: []

  use ScreensConfig.Struct,
    children: [
      evergreen_content: {:list, EvergreenContentItem}
    ]
end
