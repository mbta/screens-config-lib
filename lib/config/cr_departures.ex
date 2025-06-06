defmodule ScreensConfig.CRDepartures do
  @moduledoc false

  alias ScreensConfig.WidgetInstance

  @type platform_directions ::
          %{
            left: list(String.t()),
            right: list(String.t())
          }
          | String.t()

  @type t :: %__MODULE__{
          station: String.t(),
          destination: String.t(),
          direction_to_destination: 0 | 1,
          priority: WidgetInstance.priority(),
          wayfinding_arrows: platform_directions(),
          enabled: boolean(),
          header_pill: :red | :blue | :green | :orange,
          pair_with_alert_widget: boolean(),
          is_free: boolean()
        }

  defstruct station: nil,
            destination: nil,
            direction_to_destination: nil,
            priority: nil,
            wayfinding_arrows: nil,
            enabled: false,
            header_pill: nil,
            pair_with_alert_widget: false,
            is_free: false

  use ScreensConfig.Struct, with_default: true

  defp value_from_json("wayfinding_arrows", wayfinding_arrows) when is_map(wayfinding_arrows) do
    Map.new(wayfinding_arrows, fn {direction, track_numbers} ->
      {direction, Enum.map(track_numbers, &to_string/1)}
    end)
  end

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
