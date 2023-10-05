defmodule ScreensConfig.Util do
  @moduledoc false

  @doc """
  Gets the keys of a struct given the module where the struct is defined.

  Converts the keys to strings by default.
  """
  @spec struct_keys(module(), keyword()) :: list(atom()) | list(String.t())
  def struct_keys(mod, opts \\ []) do
    keys =
      mod
      |> Map.from_struct()
      |> Map.keys()

    if Keyword.get(opts, :as_strings, true) do
      Enum.map(keys, &Atom.to_string/1)
    else
      keys
    end
  end
end
