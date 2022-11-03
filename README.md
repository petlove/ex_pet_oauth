<h1 align="center">
  <br>
  ExPetOauth
  <br>
</h1>

<h4 align="center">Petlove&Co lib to implement Google Oauth 2.0 in Phoenix projects</h4>

<p align="center">
  <a href="#about">About</a> •
  <a href="#getting-started">Installation</a>
</p>

## About

ExPetOauth is a simple library wich uses [Ueberauth](https://github.com/ueberauth/ueberauth) and [Ueberauth Google](https://github.com/ueberauth/ueberauth_google) to implements Google Oauth 2.0 in Petlove apps.

ExPetOauth already provides the authentication routes, controllers, session control and to permits access only to users with email from `@petlove.com.br`.

## Installation

1. Setup your application at [Google Developer Console](https://console.developers.google.com/home).

2. Add :ex_pet_oauth to your list of dependencies in mix.exs:
```elixir
def deps do
  [
    {:ex_pet_oauth, "~> 1.0", git: "git@github.com:petlove/ex_pet_oauth.git"}
  ]
end
```

3. Add Google provider to your Überauth configuration:
```elixir
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [hd: "petlove.com.br", prompt: "consent", default_scope: "email profile"]}
  ]
```

4. Add the project Google credentials:
```elixir
config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")
```

5. Add ExPetOauth configuration to your project:
```elixir
config :ex_pet_oauth,
  web_module: MyAppWeb,
  user_schema: MyApp.User,
  repo: MyApp.Repo,
  layout_view: MyAppWeb.LayoutView
```

6. Add ExPetOauth routes and pipilines to your `router.ex`
```elixir
require ExPetOauthWeb.Router

ExPetOauthWeb.Router.pipelines()
ExPetOauthWeb.Router.auth_routes()
```

The `ExPetOauthWeb.Router.pipelines()` will enable you to use the pipeline `authentication` in your routes to authenticate your user before requests.

This pipeline gets the user from session and assign then to the `current_user` in your connection, it means that you can access the `current_user` in your controller methods with a pattern match like this:

```elixir
def index(%{assigns: %{current_user: current_user}} = conn, params) do
  # Do your action
end
```

In your views you can access the current_user simply by: `@current_user` constant.

**NOTE** If you want to get the current_user in a route wich doesn't use the pipeline`authentication`, you must call the `get_session(conn, :current_user)` in your controller and `assign` then to `conn`, like this:

```elixir
def index(conn, _params) do
  current_user = get_session(conn, :current_user)
  conn = assign(conn, :current_user, current_user)

  render(conn, "index.html")
end
```

7. Now you can create your login button in your Frontend to the authentication route, like this:
```elixir
 <%= button "Sign in with Google", to: Routes.auth_path(@conn, :request, "google") %>
```

It's done! Now your users can make login with Google =)




