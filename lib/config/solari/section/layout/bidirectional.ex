defmodule ScreensConfig.Solari.Section.Layout.Bidirectional do
  @moduledoc false

  alias ScreensConfig.Solari.Section.Layout.RouteConfig

  @type t :: %__MODULE__{
          routes: RouteConfig.t()
        }

  defstruct routes: RouteConfig.from_json(:default)

  use ScreensConfig.Struct, with_default: true, children: [routes: RouteConfig]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
