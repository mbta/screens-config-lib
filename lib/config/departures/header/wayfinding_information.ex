defmodule ScreensConfig.Departures.Header.WayfindingInformation do
  @moduledoc """
  Encapsulates the data required to display wayfinding help to riders.

  - `image_path` is the path of an image displayed below the title (if present).
  - `read_as` is how the image should be described in audio readouts.
  - `schedule` describes when the wayfinding information should be shown
  - `wayfinding_point` allows for a breathing blue location dot and an optional directional fan
     to be shown on the image set with `image_path`.
  """

  alias ScreensConfig.Departures.Header.WayfindingPoint
  alias ScreensConfig.Schedule

  @type t :: %__MODULE__{
          image_path: String.t(),
          read_as: String.t() | nil,
          schedule: list(Schedule.t()),
          wayfinding_point: WayfindingPoint.t() | nil
        }

  @enforce_keys [:image_path, :schedule]
  defstruct @enforce_keys ++ [read_as: nil, wayfinding_point: nil]

  use ScreensConfig.Struct

  defp value_from_json(_, value), do: value
  defp value_to_json(_, value), do: value
end
