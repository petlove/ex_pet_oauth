defmodule ExPetOauth.Plug.SessionTest do
  use ExPetOauthWeb.ConnCase

  alias ExPetOauth.Plug.Session

  setup do
    conn = build_conn()
    %{conn: conn}
  end

  test "when user isn't logged in, set nil to current_user", %{conn: conn} do
    conn =
      conn
      |> get(Routes.page_path(conn, :index))
      |> Session.call(%{})

    refute conn.assigns.current_user
  end

  test "when user logged in, set user to current_user", %{conn: conn} do
    %{conn: conn, user: user} = sign_in(conn)

    conn = Session.call(conn, %{})

    assert conn.assigns.current_user == user
  end
end
