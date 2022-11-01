defmodule ExPetOauthWeb.AuthControllerTest do
  use ExPetOauthWeb.ConnCase

  alias Ueberauth.Auth

  describe "#request" do
    test "with google authentication", %{conn: conn} do
      conn = get(conn, Routes.auth_path(conn, :request, "google"))

      assert redirected_to(conn) =~ "https://accounts.google.com/o/oauth2/v2/auth"
    end
  end

  describe "#callback" do
    test "when callback fails", %{conn: conn} do
      conn = get(conn, Routes.auth_path(conn, :callback, "google"))

      assert get_flash(conn, :error) == "Failed to authenticate."
      assert redirected_to(conn) == "/"
    end

    test "when callback succeeds", %{conn: conn} do
      user = create_user()

      auth = %Auth{
        provider: :google,
        uid: 123,
        info: %{
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          image: user.image
        }
      }

      conn = assign(conn, :ueberauth_auth, auth)
      conn = get(conn, Routes.auth_path(conn, :callback, "google"))

      assert get_flash(conn, :info) == "Successfully authenticated."
      assert redirected_to(conn) == "/"
    end

    test "when callback succeeds but returns an error", %{conn: conn} do
      conn =
        conn
        |> assign(:ueberauth_failure, "Failure!")
        |> get(Routes.auth_path(conn, :callback, "google"))

      assert get_flash(conn, :error) == "Failed to authenticate."
      assert redirected_to(conn) == "/"
    end
  end

  describe "#delete" do
    test "logout successfull", %{conn: conn} do
      %{conn: conn} = sign_in(conn)
      conn = delete(conn, Routes.auth_path(conn, :delete))

      assert get_flash(conn, :info) == "You have been logged out!"
      assert get_session(conn, :current_user) == nil
      assert redirected_to(conn) == "/"
    end
  end
end
