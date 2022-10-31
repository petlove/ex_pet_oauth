defmodule ExPetOauth.Plug.Session do
  @moduledoc "Set current user informations on conn context"

  import Plug.Conn

  def init(_) do
  end

  def call(conn, _params) do
    current_user = get_session(conn, :current_user)

    case current_user do
      nil ->
        assign(conn, :current_user, nil)

      user ->
        assign(conn, :current_user, user)
    end
  end
end
