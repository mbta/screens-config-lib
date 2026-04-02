defmodule ScreensConfig.EmergencyMessagingLocation do
  @moduledoc """
  This field indicates whether the screen is located inside or outside the station.
  Used when configuring Emergency Messaging content, which can vary based on this value.
  """

  @type t :: :inside | :outside | nil

  def from_json(value) do
    case value do
      "inside" -> :inside
      "outside" -> :outside
      _ -> nil
    end
  end

  def to_json(value), do: value
end
