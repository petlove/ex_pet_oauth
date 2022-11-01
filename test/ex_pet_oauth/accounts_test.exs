defmodule ExPetOauth.AccountsTest do
  use ExPetOauth.DataCase

  alias ExPetOauth.Accounts

  describe "users" do
    @valid_attrs %{
      email: "jailson.mendes@petlove.com.br",
      first_name: "Jailson",
      image: "some image",
      last_name: "Mendes"
    }
    @invalid_attrs %{email: nil, first_name: nil, image: nil, last_name: nil, theme: nil}

    test "get_user_by_email/1 returns the user with given id" do
      user = create_user(@valid_attrs)

      assert Accounts.get_user_by_email(user.email) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, user} = Accounts.create_user(@valid_attrs)
      assert user.email == "jailson.mendes@petlove.com.br"
      assert user.first_name == "Jailson"
      assert user.last_name == "Mendes"
      assert user.image == "some image"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
