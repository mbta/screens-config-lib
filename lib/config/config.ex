defmodule ScreensConfig.Config do
  @moduledoc false

  alias ScreensConfig.Screen

  @type t :: %__MODULE__{screens: %{screen_id => Screen.t()}}

  @type screen_id :: String.t()

  @enforce_keys [:screens]
  defstruct screens: nil

  use ScreensConfig.Struct, children: [screens: {:map, Screen}]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
