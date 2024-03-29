defmodule GodzillaCineaste.Repo.Migrations.AddUniqueFilmIdIndexesOnTables do
  use Ecto.Migration

  def change do
    create unique_index(:film_credits, [:film_id])
    create unique_index(:film_synopses, [:film_id])
  end
end
