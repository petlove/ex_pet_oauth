defmodule ExPetOauth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # Start Dummy processes only in test
    children =
      if Application.get_env(:ex_pet_oauth, :env) == :test do
        [
          ExPetOauthDummy.Repo,
          ExPetOauthDummyWeb.Endpoint
        ]
      else
        []
      end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExPetOauth.Supervisor]
    Supervisor.start_link(children, opts)
    # end
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExPetOauthDummyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
