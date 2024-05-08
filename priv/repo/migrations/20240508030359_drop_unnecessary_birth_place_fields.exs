defmodule GodzillaCineaste.Repo.Migrations.DropUnnecessaryBirthPlaceFields do
  use Ecto.Migration

  def change do
    alter table(:people) do
      remove :birth_ward
      remove :birth_city
      remove :birth_country_subdivision
      remove :birth_country
    end
  end
end
