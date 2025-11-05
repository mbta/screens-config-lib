defmodule ScreensConfig.Departures.Query do
  @moduledoc false

  alias ScreensConfig.Departures.Query.Params

  @type t :: %__MODULE__{
          params: Params.t()
        }

  defstruct params: Params.from_json(:default)

  use ScreensConfig.Struct, with_default: true, children: [params: Params]
end
