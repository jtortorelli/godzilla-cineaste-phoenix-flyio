defmodule GodzillaCineaste.Repo.Migrations.LinkFilmToWork do
  use Ecto.Migration

  def change do
    alter table(:films) do
      add :work_id, references(:works)
    end
  end
end
