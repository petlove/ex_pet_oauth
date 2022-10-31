defmodule ExPetOauthWeb.Fixtures do
  @moduledoc "Fixtures to helps user control in tests"

  import Plug.Test

  alias ExPetOauthDummy.Repo
  alias ExPetOauth.User

  @user_attrs %{
    email: "jailson.mendes@petlove.com.br",
    first_name: "Jailson",
    last_name: "Mendes",
    image: "https://cdn.dicionariopopular.com/imagens/pai-de-familia-jailson-mendes-og.jpg"
  }

  def sign_in(conn) do
    user = create_user()

    %{conn: init_test_session(conn, current_user: user), user: user}
  end

  def sign_in(conn, user),
    do: %{conn: init_test_session(conn, current_user: user), user: user}

  def create_user(attrs \\ @user_attrs) do
    {:ok, user} =
      %User{}
      |> User.changeset(attrs)
      |> Repo.insert()

    user
  end
end
