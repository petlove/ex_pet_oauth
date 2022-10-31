defmodule ExPetOauth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :image, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :email, :last_name, :image])
    |> validate_required([:first_name, :email, :last_name, :image])
  end
end
