defmodule ExPetOauthWeb.AuthControllerTest do
  use ExPetOauthWeb.ConnCase

  alias Ueberauth.Auth

  # import Mox

  # setup :verify_on_exit!

  describe "authentication process test" do
    test "tries to access without sign in", %{conn: conn} do
      conn = get(conn, Routes.page_path(conn, :show))

      assert redirected_to(conn) == "/"
      assert conn.status == 302
    end

    # test "tries to access with an user not in petlove.com.br domain", %{conn: conn} do
    #   user = insert(:user, email: "not_petlover@gmail.com")
    #   %{conn: conn} = sign_in(%{conn: conn}, user)

    #   conn = get(conn, Routes.live_path(conn, User.Index))

    #   assert redirected_to(conn) == "/"
    #   assert conn.status == 302
    # end
  end

  # describe "#request" do
  #   test "with google authentication", %{conn: conn} do
  #     conn = get(conn, Routes.auth_path(conn, :request, "google"))

  #     assert redirected_to(conn) =~ "https://accounts.google.com/o/oauth2/v2/auth"
  #   end
  # end

  # describe "#callback" do
  #   test "when callback fails", %{conn: conn} do
  #     conn = get(conn, Routes.auth_path(conn, :callback, "google"))

  #     assert get_flash(conn, :error) == "Failed to authenticate."
  #     assert redirected_to(conn) == "/"
  #   end

  #   test "when callback succeeds", %{conn: conn} do
  #     demo_user = insert(:user)

  #     Seal.Accounts.UserFromAuthMock
  #     |> expect(:find_or_create, fn _user -> {:ok, demo_user} end)

  #     auth = %Auth{
  #       provider: :google,
  #       uid: 123,
  #       info: %{
  #         first_name: demo_user.first_name,
  #         last_name: demo_user.last_name,
  #         email: demo_user.email,
  #         image: demo_user.image
  #       }
  #     }

  #     conn = assign(conn, :ueberauth_auth, auth)
  #     conn = get(conn, Routes.auth_path(conn, :callback, "google"))

  #     assert get_flash(conn, :info) == "Successfully authenticated."
  #     assert redirected_to(conn) == "/"
  #   end

  #   test "when callback succeeds but error", %{conn: conn} do
  #     Seal.Accounts.UserFromAuthMock
  #     |> expect(:find_or_create, fn _user -> {:error, "some reason"} end)

  #     demo_user = insert(:user)

  #     auth = %Auth{
  #       provider: :google,
  #       uid: 1234,
  #       info: %{
  #         first_name: demo_user.first_name,
  #         last_name: demo_user.last_name,
  #         email: demo_user.email,
  #         image: demo_user.image
  #       }
  #     }

  #     conn = assign(conn, :ueberauth_auth, auth)
  #     conn = get(conn, Routes.auth_path(conn, :callback, "google"))

  #     assert get_flash(conn, :error) == "some reason"
  #     assert redirected_to(conn) == "/"
  #   end
  # end

  # describe "#delete" do
  #   test "logout successfull", %{conn: conn} do
  #     conn = delete(conn, Routes.auth_path(conn, :delete))

  #     assert get_flash(conn, :info) == "You have been logged out!"
  #     assert redirected_to(conn) == "/"
  #   end

  #   test "when callback succeeds", %{conn: conn} do
  #     demo_user = insert(:user)

  #     Seal.Accounts.UserFromAuthMock
  #     |> expect(:find_or_create, fn _user -> {:ok, demo_user} end)

  #     auth = %Auth{
  #       provider: :google,
  #       uid: 123,
  #       info: %{
  #         first_name: demo_user.first_name,
  #         last_name: demo_user.last_name,
  #         email: demo_user.email,
  #         image: demo_user.image
  #       }
  #     }

  #     conn = assign(conn, :ueberauth_auth, auth)
  #     conn = get(conn, Routes.auth_path(conn, :callback, "google"))

  #     assert redirected_to(conn) == "/"
  #   end
  # end
end
