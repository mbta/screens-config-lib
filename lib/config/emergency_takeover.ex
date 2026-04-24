defmodule ScreensConfig.EmergencyTakeover do
  @moduledoc false

  @type t :: %__MODULE__{
          audio_asset_path: String.t() | nil,
          text_for_audio: String.t() | nil,
          visual_asset_path: String.t()
        }

  @enforce_keys ~w[visual_asset_path]a
  defstruct [:audio_asset_path, :text_for_audio, visual_asset_path: ""]

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
