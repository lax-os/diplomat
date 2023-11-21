defmodule Diplomat.Mixfile do
  use Mix.Project

  def project do
    [
      app: :diplomat,
      version: "0.12.1",
      elixir: "~> 1.5",
      description: "A library for interacting with Google's Cloud Datastore",
      package: package(),
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      dialyzer: [ignore_warnings: ".dialyzer.ignore-warnings"]
    ]
  end

  def application do
    []
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:gpb, "~> 4.20", override: true},
      {:goth, "~> 1.0"},
      {:exprotobuf, github: "lax-os/exprotobuf", branch: "master"},
      {:httpoison, "~> 1.2"},
      {:jason, "~> 1.1"},
      {:credo, "~> 1.0", only: [:dev, :test]},
      {:bypass, "~> 0.8", only: :test},
      {:plug_cowboy, "~> 1.0", only: :test},
      {:mix_test_watch, "~> 0.4", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev},
      {:uuid, "~> 1.1", only: :test},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Phil Burrows"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/peburrows/diplomat"}
    ]
  end
end
