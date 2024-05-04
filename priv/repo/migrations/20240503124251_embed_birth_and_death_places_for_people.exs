defmodule GodzillaCineaste.Repo.Migrations.EmbedBirthAndDeathPlacesForPeople do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :birth_place, :map, default: "{}"
      add :death_place, :map, default: "{}"
    end
  end
end
