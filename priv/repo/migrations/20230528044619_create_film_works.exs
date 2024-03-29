defmodule GodzillaCineaste.Repo.Migrations.CreateFilmWorks do
  use Ecto.Migration

  def change do
    create table(:film_works) do
      add :film_id, references(:films)
      add :work_id, references(:works)

      timestamps()
    end
  end
end
