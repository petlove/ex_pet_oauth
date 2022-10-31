defmodule ExPetOauthWeb.PageControllerTest do
  use ExPetOauthWeb.ConnCase

  describe "index" do
    test "GET / when user isn't logged", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Sign in with Google"
    end

    test "GET / when user already logged in", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Sign in with Google"
    end
  end
end
