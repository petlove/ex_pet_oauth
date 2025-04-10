defmodule ExPetOauth.Plug.Authentication do
  @moduledoc "Set current user informations on conn context"

  import Plug.Conn
  import Phoenix.Controller

  def init(_) do
  end

  def call(conn, _params) do
    conn
    |> get_session(:current_user)
    |> handle_session(conn)
  end

  defp handle_session(nil, conn), do: restrict_access(conn)

  defp handle_session(user, conn) do
    if is_struct(user) && valid_email?(user.email) do
      assign(conn, :current_user, user)
    else
      restrict_access(conn)
    end
  end

  defp restrict_access(conn) do
    conn
    |> put_flash(:error, "Faça o login")
    |> redirect(to: "/")
    |> halt()
  end

  defp valid_email?(email) do
    String.match?(email, ~r/@petlove.com.br$/) || String.match?(email, ~r/@outsourcing.petlove.com.br$/)
  end
end
