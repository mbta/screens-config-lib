defmodule ScreensConfig.Departures.Params do
  @moduledoc false
  # credo:disable-for-this-file Credo.Check.Design.DuplicatedCode

  alias ScreensConfig.Departures.Mode

  @type t :: %__MODULE__{
          mode: Mode.t(),
          stop_ids: list(String.t()),
          route_ids: list(String.t()),
          direction_id: 0 | 1 | :both
        }

  @enforce_keys [:mode]
  defstruct @enforce_keys ++ [stop_ids: [], route_ids: [], direction_id: :both]

  use ScreensConfig.Struct, children: [mode: Mode]

  defp value_from_json("direction_id", "both"), do: :both

  defp value_from_json("mode", mode) when is_binary(mode) do
    ScreensConfig.Departures.Mode.from_json(mode)
  end

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
