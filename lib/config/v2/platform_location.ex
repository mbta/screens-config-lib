defmodule ScreensConfig.V2.PlatformLocation do
  @moduledoc false

  @type t :: %__MODULE__{
          platform_location: :front | :back
        }

  defstruct platform_location: nil

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
