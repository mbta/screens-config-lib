defmodule ScreensConfig.Solari.Section.Headway do
  @moduledoc false

  @typep sign_id :: String.t()
  @typep headway_id :: String.t()
  @typep headsign :: String.t()

  @type t :: %__MODULE__{
          sign_ids: [sign_id],
          headway_id: headway_id,
          headsigns: [headsign]
        }

  defstruct sign_ids: [],
            headway_id: nil,
            headsigns: []

  use ScreensConfig.Struct, with_default: true

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
