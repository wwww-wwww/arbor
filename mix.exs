defmodule Arbor.Mixfile do
  use Mix.Project
  @version "1.1.0"

  def project do
    [
      app: :arbor,
      description: "Ecto adjacency list and tree traversal",
      version: @version,
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      deps: deps(),
      aliases: aliases(),
      docs: docs()
    ]
  end

  def application do
    [applications: [:logger, :ecto]]
  end

  defp aliases do
    [
      "db.reset": ["ecto.drop", "ecto.create", "ecto.migrate"],
      test: ["db.reset", "test"]
    ]
  end

  defp deps do
    [
      {:ecto_sql, ">= 3.8.0"},
      {:postgrex, ">= 0.0.0"},
      {:earmark, "~> 1.1", only: [:docs, :dev]},
      {:ex_doc, "~> 0.19", only: [:docs, :dev]}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Cory O'Daniel"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/coryodaniel/arbor"},
      files: ~w(mix.exs README.md lib)
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}",
      source_url: "https://github.com/coryodaniel/arbor"
    ]
  end
end
