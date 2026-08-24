defmodule ScreensConfig.Departures.Mode do
  @moduledoc """
  Departures query parameter representing the single line/route
  that a section will take.
  """
  alias ScreensConfig.RouteType
  @type t :: :bl | :ol | :rl | :m | :gl | :sl | :bus | :cr | :ferry
  @subway_modes [:bl, :ol, :rl]
  @light_rail_modes [:m, :gl]
  @bus_modes [:sl, :bus]

  @spec from_json(String.t()) :: t() | nil
  for atom <- ~w(bl ol rl m gl sl bus cr ferry)a do
    def from_json(unquote(to_string(atom))), do: unquote(atom)
  end

  @spec to_json(atom()) :: String.t()
  for atom <- ~w(bl ol rl m gl sl bus cr ferry)a do
    def to_json(unquote(atom)), do: unquote(to_string(atom))
  end

  @spec to_route_type(t()) :: RouteType.t() | nil
  def to_route_type(mode) do
    cond do
      mode == :ferry -> :ferry
      mode == :cr -> :rail
      mode in @subway_modes -> :subway
      mode in @light_rail_modes -> :light_rail
      mode in @bus_modes -> :bus
      true -> nil
    end
  end
end
