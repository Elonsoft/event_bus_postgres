defmodule EventBus.Postgres.Mixfile do
  use Mix.Project

  def project do
    [
      app: :event_bus_postgres,
      version: "0.3.1",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EventBus.Postgres.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:event_bus, ">= 1.4.1"},
      {:ecto, "~> 2.2"},
      {:postgrex, ">= 0.0.0"},
      {:gen_stage, "~> 0.14.0"},
      {:uuid, "~> 1.1", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "~> 0.10.0", only: :dev}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp description do
    """
    Postgres event store for event_bus
    """
  end

  defp package do
    [
      name: :event_bus_postgres,
      files: ["lib", "mix.exs", "priv", "README.md"],
      maintainers: ["Mustafa Turan"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mustafaturan/event_bus_postgres"}
    ]
  end
end
