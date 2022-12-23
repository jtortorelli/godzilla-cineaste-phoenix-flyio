defmodule GodzillaCineaste.Repo.Migrations.CreateFilmCreditsTable do
  use Ecto.Migration

  def change do
    create table(:film_credits) do
      add :credits, :text
      add :film_id, references(:films)
      timestamps()
    end

    alter table(:film_credits) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end
  end
end
