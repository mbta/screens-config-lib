defmodule ScreensConfig.InOut do
  @moduledoc false

  @type t :: :inside | :outside | nil

  def from_json(in_out) do
    case in_out do
      "inside" -> :inside
      "outside" -> :outside
      _ -> nil
    end
  end

  def to_json(value), do: value
end
