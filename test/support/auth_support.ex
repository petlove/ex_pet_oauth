defmodule ExPetOauthWeb.AuthSupport do
  @moduledoc "inject current user on healer to help test that need authentication "

  import Plug.Test
  # import ExPetOauthWeb.Factory

  def sign_in(conn) do
    user = %{}

    %{conn: init_test_session(conn, current_user: user), user: user}
  end

  def sign_in(conn, user),
    do: %{conn: init_test_session(conn, current_user: user), user: user}
end
