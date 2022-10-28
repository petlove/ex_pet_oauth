defmodule ExPetOauthWeb.PageController do
  use ExPetOauthWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
