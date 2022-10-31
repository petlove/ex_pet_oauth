defmodule ExPetOauthDummyWeb.Router do
  use ExPetOauthDummyWeb, :router
  require ExPetOauthWeb.Router

  ExPetOauthWeb.Router.pipelines()
  ExPetOauthWeb.Router.auth_routes()

  pipeline :authorization do
    plug ExPetOauth.Plug.Session
  end

  scope "/", ExPetOauthDummyWeb do
    pipe_through([:ex_pet_oauth_browser, :authorization])

    get("/", PageController, :index)
  end
end
