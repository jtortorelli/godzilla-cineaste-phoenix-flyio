defmodule GodzillaCineaste.Repo.Migrations.AddUniqueIndexes do
  use Ecto.Migration

  def change do
    create index(:studios, [:slug])
    create index(:person_staff, [:film_id, :person_id, :role])
    create index(:people, [:slug])
    create index(:kaiju_characters, [:slug])
    create index(:film_series, [:slug])
    create index(:films, [:slug])
    create index(:characters, [:slug])
    create index(:film_series_entries, [:film_id])
  end
end
