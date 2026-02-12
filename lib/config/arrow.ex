defmodule ScreensConfig.Arrow do
  @moduledoc """
  Represents an arrow direction to be displayed on screens.
  """

  @type t :: :n | :ne | :e | :se | :s | :sw | :w | :nw | nil

  @spec from_json(String.t() | nil) :: t()
  for atom <- ~w(n ne e se s sw w nw)a do
    def from_json(unquote(to_string(atom))), do: unquote(atom)
  end

  def from_json(value) when value in [nil, ""], do: nil
end
