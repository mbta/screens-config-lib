defmodule ScreensConfig.V2.Audio do
  @moduledoc false

  @type t :: %__MODULE__{
          interval_enabled: boolean(),
          interval_offset_seconds: non_neg_integer()
        }

  defstruct interval_enabled: false, interval_offset_seconds: 0

  use ScreensConfig.Struct, with_default: true

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
