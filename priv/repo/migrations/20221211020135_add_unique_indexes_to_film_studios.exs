defmodule GodzillaCineaste.Repo.Migrations.AddUniqueIndexesToFilmStudios do
  use Ecto.Migration

  def change do
    create unique_index(:film_studios, [:film_id, :studio_id])
  end
end
