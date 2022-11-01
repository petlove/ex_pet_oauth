defmodule ExPetOauth.Plug.AuthenticationTest do
  use ExPetOauthWeb.ConnCase

  setup do
    conn = build_conn()
    %{conn: conn}
  end

  test "when user isn't logged in, redirect to base path", %{conn: conn} do
    conn =
      conn
      |> get(Routes.page_path(conn, :show))

    assert redirected_to(conn) == "/"
    assert conn.status == 302
  end

  test "when user try to login with email out of petlove domain, redirect to base path", %{
    conn: conn
  } do
    user =
      create_user(%{
        first_name: "Fake user",
        last_name: "fake",
        image: "null",
        email: "fake@fake.com"
      })

    %{conn: conn} = sign_in(conn, user)

    conn = get(conn, Routes.page_path(conn, :show))

    assert redirected_to(conn) == "/"
    assert conn.status == 302
  end

  test "when user logged in, set then to current_user", %{conn: conn} do
    %{conn: conn, user: user} = sign_in(conn)

    conn = get(conn, Routes.page_path(conn, :show))

    assert conn.assigns.current_user == user
  end
end
