defmodule ScreensConfig.MixProject do
  use Mix.Project

  def project do
    [
      app: :screens_config,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.0"},
      {:credo, "~> 1.7.6", only: [:dev, :test]},
      {:dialyxir, "~> 1.4.3", only: [:dev, :test], runtime: false}
    ]
  end
end
