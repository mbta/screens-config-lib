defmodule ScreensConfig.Departures.Query do
  @moduledoc false

  alias ScreensConfig.Departures.Query.{Opts, Params}

  @type t :: %__MODULE__{
          params: Params.t(),
          opts: Opts.t()
        }

  defstruct params: Params.from_json(:default),
            opts: Opts.from_json(:default)

  use ScreensConfig.Struct, with_default: true, children: [params: Params, opts: Opts]
end
