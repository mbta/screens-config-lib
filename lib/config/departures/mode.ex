defmodule ScreensConfig.Departures.Mode do
  @moduledoc """
  Departures query parameter representing the single line/route
  that a section will take.
  """
  alias ScreensConfig.RouteType
  @type t :: :bl | :ol | :rl | :m | :gl | :sl | :bus | :cr | :ferry

  @spec from_json(String.t()) :: t() | nil
  for atom <- ~w(bl ol rl m gl sl bus cr ferry)a do
    def from_json(unquote(to_string(atom))), do: unquote(atom)
  end

  @spec to_json(atom()) :: String.t()
  for atom <- ~w(bl ol rl m gl sl bus cr ferry)a do
    def to_json(unquote(atom)), do: unquote(to_string(atom))
  end

  @spec to_route_type(t()) :: RouteType.t()
  def to_route_type(:ferry), do: :ferry
  def to_route_type(:cr), do: :rail
  def to_route_type(mode) when mode in [:bl, :ol, :rl], do: :subway
  def to_route_type(mode) when mode in [:m, :gl], do: :light_rail
  def to_route_type(mode) when mode in [:sl, :bus], do: :bus
end
