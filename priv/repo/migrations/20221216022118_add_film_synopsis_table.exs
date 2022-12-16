defmodule GodzillaCineaste.Repo.Migrations.AddSynopsisTextColumn do
  use Ecto.Migration

  def change do
    create table(:film_synopses) do
      add :synopsis, :text
      add :film_id, references(:films)
      timestamps()
    end

    alter table(:film_synopses) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end
  end
end
