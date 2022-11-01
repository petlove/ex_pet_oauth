defmodule Seal.UserFromAuthTest do
  use ExPetOauth.DataCase

  alias ExPetOauth.UserFromAuth
  alias Ueberauth.Auth

  describe "#find_or_create" do
    test "retrieves a user when it exists" do
      demo_user = create_user()

      auth = %Auth{
        provider: :google,
        uid: 123,
        info: %{
          first_name: demo_user.first_name,
          last_name: demo_user.last_name,
          email: demo_user.email,
          image: demo_user.image
        }
      }

      {:ok, user} = UserFromAuth.find_or_create(auth)

      assert user.first_name == demo_user.first_name
      assert user.last_name == demo_user.last_name
      assert user.email == demo_user.email
      assert user.image == demo_user.image
    end

    test "creates a user when NOT exists" do
      auth = %Auth{
        provider: :google,
        uid: "1123432",
        info: %{
          first_name: "John",
          last_name: "Doe",
          email: "john@petlove.com.br",
          image: "profile.png"
        }
      }

      {:ok, user} = UserFromAuth.find_or_create(auth)

      assert user.first_name == "John"
      assert user.last_name == "Doe"
      assert user.image == "profile.png"
      assert user.email == "john@petlove.com.br"
    end
  end
end
