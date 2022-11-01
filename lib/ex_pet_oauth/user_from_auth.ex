defmodule ExPetOauth.UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """

  alias ExPetOauth.Accounts
  alias Ueberauth.Auth

  def find_or_create(%Auth{provider: :google} = auth) do
    changes = basic_info(auth)

    case Accounts.get_user_by_email(auth.info.email) do
      nil -> Accounts.create_user(changes)
      user -> {:ok, user}
    end
  end

  defp basic_info(auth) do
    %{
      id: auth.uid,
      email: auth.info.email,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      image: auth.info.image
    }
  end
end
