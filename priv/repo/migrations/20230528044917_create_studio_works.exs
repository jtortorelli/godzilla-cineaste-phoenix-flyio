defmodule GodzillaCineaste.Repo.Migrations.CreateStudioWorks do
  use Ecto.Migration

  def change do
    create table(:studio_works) do
      add :studio_id, references(:studios)
      add :work_id, references(:works)

      timestamps()
    end
  end
end
