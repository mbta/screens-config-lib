defmodule ScreensConfig.Dup.Override.PartialAlertList do
  @moduledoc false

  alias ScreensConfig.Dup.Override.PartialAlert

  @type t :: %__MODULE__{alerts: list(PartialAlert.t())}

  @enforce_keys [:alerts]
  defstruct @enforce_keys

  use ScreensConfig.Struct, children: [alerts: {:list, PartialAlert}]

  def to_json(%__MODULE__{} = t) do
    t
    |> super()
    |> Map.put(:type, :partial)
  end
end
