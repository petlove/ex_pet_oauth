defmodule ExPetOauthDummyWeb.Router do
  use ExPetOauthDummyWeb, :router
  require ExPetOauthWeb.Router

  ExPetOauthWeb.Router.pipelines()
  ExPetOauthWeb.Router.auth_routes()

  scope "/", ExPetOauthDummyWeb do
    pipe_through([:ex_pet_oauth_browser, :authentication])

    get("/", PageController, :index)
  end
end
