defmodule GodzillaCineaste.Repo.Migrations.MakeIndexesUnique do
  use Ecto.Migration

  def change do
    drop index(:studios, [:slug])
    drop index(:person_staff, [:film_id, :person_id, :role])
    drop index(:people, [:slug])
    drop index(:kaiju_characters, [:slug])
    drop index(:film_series, [:slug])
    drop index(:films, [:slug])
    drop index(:characters, [:slug])
    drop index(:film_series_entries, [:film_id])
    create unique_index(:studios, [:slug])
    create unique_index(:person_staff, [:film_id, :person_id, :role])
    create unique_index(:people, [:slug])
    create unique_index(:kaiju_characters, [:slug])
    create unique_index(:film_series, [:slug])
    create unique_index(:films, [:slug])
    create unique_index(:characters, [:slug])
    create unique_index(:film_series_entries, [:film_id])
  end
end
