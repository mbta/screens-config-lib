defmodule ScreensConfig.Screen do
  @moduledoc false

  @behaviour ScreensConfig.Behaviour

  alias ScreensConfig.{Util, V2}

  @type app_id ::
          :bus_eink_v2
          | :bus_shelter_v2
          | :busway_v2
          | :dup_v2
          | :elevator_v2
          | :gl_eink_v2
          | :pre_fare_v2
          | :on_bus_v2

  @type t :: %__MODULE__{
          app_id: app_id(),
          app_params:
            V2.BusEink.t()
            | V2.BusShelter.t()
            | V2.Busway.t()
            | V2.Dup.t()
            | V2.Elevator.t()
            | V2.GlEink.t()
            | V2.PreFare.t()
            | V2.OnBus.t(),
          device_id: String.t(),
          disabled: boolean(),
          hidden_from_screenplay: boolean(),
          name: String.t(),
          refresh_if_loaded_before: DateTime.t() | nil,
          tags: list(String.t()),
          vendor: :c3ms | :gds | :lg_mri | :mercury | :mimo | :outfront | :solari | nil
        }

  @recognized_app_ids ~w[bus_eink_v2 bus_shelter_v2 busway_v2 dup_v2 elevator_v2 gl_eink_v2 solari_large_v2 pre_fare_v2 on_bus_v2]a
  @recognized_app_id_strings Enum.map(@recognized_app_ids, &Atom.to_string/1)
  @recognized_vendors ~w[gds mercury solari c3ms outfront lg_mri mimo hanover]a

  @app_config_modules_by_app_id %{
    bus_eink_v2: V2.BusEink,
    bus_shelter_v2: V2.BusShelter,
    busway_v2: V2.Busway,
    dup_v2: V2.Dup,
    elevator_v2: V2.Elevator,
    gl_eink_v2: V2.GlEink,
    pre_fare_v2: V2.PreFare,
    on_bus_v2: V2.OnBus,
  }

  @enforce_keys ~w[app_id app_params device_id name vendor]a
  defstruct app_id: nil,
            app_params: nil,
            device_id: nil,
            disabled: false,
            hidden_from_screenplay: false,
            name: nil,
            refresh_if_loaded_before: nil,
            tags: [],
            vendor: nil

  @impl true
  @spec from_json(map()) :: t() | nil
  def from_json(%{"app_id" => app_id} = json) when app_id in @recognized_app_id_strings do
    app_id = String.to_existing_atom(app_id)

    struct_map =
      json
      |> Map.take(Util.struct_keys(__MODULE__))
      |> Enum.into(%{}, fn {k, v} ->
        {String.to_existing_atom(k), value_from_json(k, v, app_id)}
      end)

    struct!(__MODULE__, struct_map)
  end

  # Prevents the application from breaking if we introduce a new app_id
  def from_json(_), do: nil

  @impl true
  @spec to_json(t()) :: map()
  def to_json(%__MODULE__{app_id: app_id} = t) do
    t
    |> Map.from_struct()
    |> Enum.into(%{}, fn {k, v} -> {k, value_to_json(k, v, app_id)} end)
  end

  @spec schedule_refresh_at_time(t(), DateTime.t()) :: t()
  def schedule_refresh_at_time(screen_config, time) do
    %__MODULE__{screen_config | refresh_if_loaded_before: time}
  end

  defp value_from_json("vendor", vendor_string, _app_id) when vendor_string in ["n/a", "", nil],
    do: nil

  for vendor <- @recognized_vendors do
    vendor_string = Atom.to_string(vendor)

    defp value_from_json("vendor", unquote(vendor_string), _app_id) do
      unquote(vendor)
    end
  end

  defp value_from_json("vendor", unknown_vendor, _app_id),
    do: raise("unknown vendor #{unknown_vendor}")

  defp value_from_json("app_id", _app_id_string, app_id), do: app_id

  defp value_from_json("refresh_if_loaded_before", timestamp, _app_id)
       when is_binary(timestamp) do
    case DateTime.from_iso8601(timestamp) do
      {:ok, dt, _} -> dt
      {:error, _} -> nil
    end
  end

  defp value_from_json("app_params", app_params, app_id) do
    @app_config_modules_by_app_id[app_id].from_json(app_params)
  end

  defp value_from_json(_, value, _), do: value

  defp value_to_json(:refresh_if_loaded_before, %DateTime{} = dt, _app_id) do
    DateTime.to_iso8601(dt)
  end

  defp value_to_json(:app_params, app_params, app_id) do
    @app_config_modules_by_app_id[app_id].to_json(app_params)
  end

  defp value_to_json(_, value, _), do: value
end
