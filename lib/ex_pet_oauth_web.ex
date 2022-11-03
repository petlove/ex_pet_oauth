defmodule ExPetOauthWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use ExPetOauthWeb, :controller
      use ExPetOauthWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    web_module = Application.get_env(:ex_et_oauth, :web_module)

    quote do
      use Phoenix.Controller, namespace: ExPetOauthWeb

      import Plug.Conn
      import ExPetOauthWeb.Gettext
      alias unquote(web_module).Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end
  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
