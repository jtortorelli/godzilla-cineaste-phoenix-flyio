defmodule GodzillaCineaste.Repo.Migrations.CreateFilmStudiosJoinTable do
  use Ecto.Migration

  def change do
    create table(:film_studios) do
      add :film_id, references(:films)
      add :studio_id, references(:studios)
    end
  end
end
