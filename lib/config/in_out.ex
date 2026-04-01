defmodule ScreensConfig.InOut do
  @moduledoc false

  @type t :: :inside | :outside | nil

  defp value_from_json("platform_location", location) do
    case location do
      "inside" -> :inside
      "outside" -> :outside
      _ -> nil
    end
  end

  defp value_to_json(_, value), do: value
end
