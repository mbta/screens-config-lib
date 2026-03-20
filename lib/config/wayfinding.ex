defmodule ScreensConfig.Wayfinding do
  @moduledoc false

  @type placement :: :top | :bottom

  @type t :: %__MODULE__{
          asset_url: String.t(),
          placement: placement() | nil,
          header_text: String.t() | nil,
          text_for_audio: String.t() | nil
        }

  @enforce_keys ~w[asset_url]a
  defstruct [:placement, :header_text, :text_for_audio, asset_url: ""]

  use ScreensConfig.Struct

  defp value_from_json("placement", "top"), do: :top
  defp value_from_json("placement", "bottom"), do: :bottom
  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
