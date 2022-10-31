import Config

config :ex_pet_oauth,
  ecto_repos: [ExPetOauthDummy.Repo]

# Configures the endpoint
config :ex_pet_oauth, ExPetOauthDummyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AJifLO3O2O9g5ZbqKyGNPEklxuNA8BIIqXTWYU+wxgdTEvzjHbz1FUj0scAX647D",
  render_errors: [view: ExPetOauthDummyWeb.ErrorView, accepts: ~w(html json), layout: false]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    google:
      {Ueberauth.Strategy.Google,
       [hd: "petlove.com.br", prompt: "consent", default_scope: "email profile"]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
