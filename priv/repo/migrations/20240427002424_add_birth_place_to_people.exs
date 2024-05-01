defmodule GodzillaCineaste.Repo.Migrations.AddBirthPlaceToPeople do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :birth_ward, :string
      add :birth_city, :string
      add :birth_country_subdivision, :string
      add :birth_country, :string
    end
  end
end
