defmodule ScreensConfig.Header do
  @moduledoc """
  Common header type for most screens. Can be configured with a `stop_name` (really an arbitrary
  string, presented as-is) or a `stop_id` (indicating the header should be the name of that stop).

  `use ScreensConfig.Header` inserts appropriate `value_from_json` and `value_to_json` clauses to
  encode and decode these variants.
  """

  defmodule StopId do
    @moduledoc false

    @type t :: %__MODULE__{stop_id: String.t()}

    @enforce_keys [:stop_id]
    defstruct @enforce_keys

    use ScreensConfig.Struct

    defp value_from_json(_, value), do: value
    defp value_to_json(_, value), do: value
  end

  defmodule StopName do
    @moduledoc false

    @type t :: %__MODULE__{stop_name: String.t()}

    @enforce_keys [:stop_name]
    defstruct @enforce_keys

    use ScreensConfig.Struct

    defp value_from_json(_, value), do: value
    defp value_to_json(_, value), do: value
  end

  @type t :: StopId.t() | StopName.t()

  defmacro __using__(_opts) do
    quote location: :keep do
      defp value_from_json("header", %{"stop_name" => _} = value), do: StopName.from_json(value)
      defp value_from_json("header", %{"stop_id" => _} = value), do: StopId.from_json(value)
      defp value_to_json(:header, %module{} = value), do: module.to_json(value)
    end
  end
end
