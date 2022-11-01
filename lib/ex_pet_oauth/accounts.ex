defmodule ExPetOauth.Accounts do
  @moduledoc """
  Accounts context
  """

  def get_user_by_email(email), do: repo().get_by(user_schema(), email: email)

  def create_user(attrs) do
    user_schema()
    |> struct!()
    |> user_schema().changeset(attrs)
    |> repo().insert()
  end

  defp user_schema, do: Application.fetch_env!(:ex_pet_oauth, :user_schema)
  defp repo, do: Application.fetch_env!(:ex_pet_oauth, :repo)
end
