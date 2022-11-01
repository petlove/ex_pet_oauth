defmodule ExPetOauthDummyWeb.PageController do
  use ExPetOauthDummyWeb, :controller

  def index(conn, _params) do
    conn = assign(conn, :current_user, get_session(conn, :current_user))
    render(conn, "index.html")
  end

  def show(conn, _params) do
    render(conn, "index.html")
  end
end
