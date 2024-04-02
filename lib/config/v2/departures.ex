defmodule ScreensConfig.V2.Departures do
  @moduledoc """
  Configures the "departures" widget shared across several screen types, which displays upcoming
  departures.
  """

  alias ScreensConfig.V2.Departures.Section

  @type t :: %__MODULE__{sections: list(Section.t())}

  @enforce_keys [:sections]
  defstruct sections: []

  use ScreensConfig.Struct, children: [sections: {:list, Section}]
end
