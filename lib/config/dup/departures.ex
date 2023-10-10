defmodule ScreensConfig.Dup.Departures do
  @moduledoc false

  alias ScreensConfig.Dup.Section

  @type t :: %__MODULE__{
          header: String.t(),
          sections: list(Section.t())
        }

  defstruct header: "",
            sections: []

  use ScreensConfig.Struct, with_default: true, children: [sections: {:list, Section}]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
