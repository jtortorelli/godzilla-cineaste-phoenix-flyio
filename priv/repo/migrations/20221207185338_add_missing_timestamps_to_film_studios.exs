defmodule GodzillaCineaste.Repo.Migrations.AddMissingTimestampsToFilmStudios do
  use Ecto.Migration

  def change do
    alter table(:film_studios) do
      timestamps()
    end
  end
end
