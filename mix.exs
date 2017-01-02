defmodule Slippers.Mixfile do
  use Mix.Project

  def project do
    [
      app: :slippers,
      version: "0.1.0",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description,
      package: package,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: cli_env_for(:test, [
        "coveralls", "coveralls.detail", "coveralls.post",
      ])
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  defp description do
    """
    Simple Elixir wrapper for the 10000ft API
    """
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.10.0"},
      {:poison, "~> 3.0"},
      {:earmark, "> 1.0.0"},
      {:ex_doc, "~> 0.14"},
      {:inch_ex, "~> 0.5"},
      {:excoveralls, "~> 0.5", only: :test},
      {:exvcr, "~> 0.8", only: :test},
      {:meck, "~> 0.8", only: :test }
    ]
  end

  defp package do
    [
      maintainers: ["nickcoyne"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nickcoyne/slippers"}
    ]
  end

  defp cli_env_for(env, tasks) do
    Enum.reduce(tasks, [], fn(key, acc) -> Keyword.put(acc, :"#{key}", env) end)
  end
end
