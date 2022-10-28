defmodule ExPetOauth.Repo do
  use Ecto.Repo,
    otp_app: :ex_pet_oauth,
    adapter: Ecto.Adapters.Postgres
end
