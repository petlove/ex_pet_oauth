defmodule ExPetOauthDummyWeb.PageController do
  use ExPetOauthDummyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
