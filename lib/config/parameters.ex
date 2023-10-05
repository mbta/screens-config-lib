defmodule ScreensConfig.V2.ScreenData.Parameters do
  # This list should contain IDs of any apps that __do not__ show any widget that implements `Screens.V2.AlertsWidget`.
  @apps_that_do_not_show_alerts [:triptych_v2]

  @doc """
  Returns true for screen types that can show any widget that implements `Screens.V2.AlertsWidget`.
  """
  @spec shows_alerts?(ScreensConfig.Screen.t() | atom()) :: boolean()
  def shows_alerts?(%ScreensConfig.Screen{app_id: app_id}) do
    shows_alerts?(app_id)
  end

  def shows_alerts?(app_id) do
    app_id not in @apps_that_do_not_show_alerts
  end
end
