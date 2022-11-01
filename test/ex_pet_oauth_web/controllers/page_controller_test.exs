defmodule ExPetOauthWeb.PageControllerTest do
  use ExPetOauthWeb.ConnCase

  describe "index" do
    test "GET / when user isn't logged", %{conn: conn} do
      conn = get(conn, Routes.page_path(conn, :index))
      assert html_response(conn, 200) =~ "Sign in with Google"
    end

    test "GET / when user already logged in", %{conn: conn} do
      %{conn: conn, user: user} = sign_in(conn)

      conn = get(conn, Routes.page_path(conn, :index))

      assert html = html_response(conn, 200)
      assert html =~ user.first_name
      assert html =~ "Logout"
    end
  end

  describe "show" do
    test "GET /manage when user isn't logged", %{conn: conn} do
      conn = get(conn, Routes.page_path(conn, :show))

      assert redirected_to(conn) == "/"
      assert conn.status == 302
    end

    test "GET /manage when user already logged in", %{conn: conn} do
      %{conn: conn, user: user} = sign_in(conn)

      conn = get(conn, Routes.page_path(conn, :show))

      assert html = html_response(conn, 200)
      assert html =~ user.first_name
      assert html =~ "Logout"
    end
  end
end
