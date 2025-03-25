defmodule ScreensConfig.FullLineMap do
  @moduledoc false

  @type t :: %__MODULE__{
          asset_path: String.t()
        }

  @enforce_keys [:asset_path]
  defstruct asset_path: nil

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
