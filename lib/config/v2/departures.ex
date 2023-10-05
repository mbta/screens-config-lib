defmodule ScreensConfig.V2.Departures do
  @moduledoc false

  alias ScreensConfig.V2.Departures.Section

  @type t :: %__MODULE__{sections: list(Section.t())}

  @enforce_keys [:sections]
  defstruct sections: []

  use ScreensConfig.Struct, children: [sections: {:list, Section}]
end
