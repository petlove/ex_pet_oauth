defmodule ExPetOauth.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:first_name, :string)
      add(:email, :string)
      add(:last_name, :string)
      add(:image, :string)

      timestamps()
    end
  end
end
