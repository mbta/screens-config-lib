defmodule ScreensConfig.Departures.Query do
  @moduledoc false

  alias ScreensConfig.Departures.Query.Params

  @type t :: %__MODULE__{
          params: Params.t()
        }

  @enforce_keys [:params]
  defstruct @enforce_keys

  use ScreensConfig.Struct, children: [params: Params]
end
