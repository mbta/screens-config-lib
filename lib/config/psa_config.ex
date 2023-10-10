defmodule ScreensConfig.PsaConfig do
  @moduledoc false

  alias ScreensConfig.PsaConfig.{OverrideList, PsaList}

  @type t :: %__MODULE__{
          default_list: PsaList.t(),
          scheduled_overrides: [OverrideList.t()]
        }

  defstruct default_list: PsaList.from_json(:default),
            scheduled_overrides: []

  use ScreensConfig.Struct,
    with_default: true,
    children: [default_list: PsaList, scheduled_overrides: {:list, OverrideList}]

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
