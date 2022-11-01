defmodule ExPetOauthWeb.Router do
  defmacro pipelines do
    quote do
      pipeline :ex_pet_oauth_browser do
        plug :accepts, ["html"]
        plug :fetch_session
        plug :fetch_live_flash
        plug :put_root_layout, {ExPetOauthWeb.LayoutView, :root}
        plug :protect_from_forgery
        plug :put_secure_browser_headers
      end

      pipeline :authentication do
        plug ExPetOauth.Plug.Authentication
      end
    end
  end

  defmacro auth_routes(controller \\ ExPetOauthWeb.AuthController) do
    quote do
      scope "/auth" do
        pipe_through :ex_pet_oauth_browser

        get "/:provider", unquote(controller), :request
        get "/:provider/callback", unquote(controller), :callback

        delete "/logout", unquote(controller), :delete
      end
    end
  end
end
