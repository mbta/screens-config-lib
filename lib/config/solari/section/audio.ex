defmodule ScreensConfig.Solari.Section.Audio do
  @moduledoc false

  @type t :: %__MODULE__{
          wayfinding: String.t() | nil
        }

  defstruct wayfinding: nil

  use ScreensConfig.Struct, with_default: true

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
