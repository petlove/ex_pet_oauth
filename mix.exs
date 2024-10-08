defmodule ExPetOauth.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_pet_oauth,
      version: get_version(),
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      name: "ExPetOauth",
      description: "Phoenix boilerplate for Petlove&Co Google OAuth 2.0",
      package: package(),
      source_url: "https://github.com/petlove/ex_path_oauth"
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {ExPetOauth.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:ecto_sql, "~> 3.6", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:floki, ">= 0.30.0", only: :test},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:phoenix, "~> 1.7.12"},
      {:phoenix_ecto, "~> 4.4", only: :test},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_view, "~> 0.20.2"},
      {:postgrex, ">= 0.0.0", only: :test},
      {:ueberauth_google, "~> 0.10"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      test: [
        "ecto.create --quiet --repo ExPetOauthDummy.Repo",
        "ecto.migrate --quiet --repo ExPetOauthDummy.Repo --migrations-path test/support/ex_pet_oauth_dummy/priv/repo/migrations",
        "test"
      ]
    ]
  end

  defp get_version do
    case File.read("VERSION") do
      {:ok, version} -> String.trim(version)
      _ -> "0.0.0-unknown"
    end
  end

  def package do
    [
      name: :ex_pet_oauth,
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/petlove/ex_pet_oauth"
      },
      files: ~w(lib .formatter.exs LICENSE mix.exs README.md VERSION)
    ]
  end
end
