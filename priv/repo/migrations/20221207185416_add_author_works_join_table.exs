defmodule GodzillaCineaste.Repo.Migrations.AddAuthorWorksJoinTable do
  use Ecto.Migration

  def change do
    create table(:author_works) do
      add :person_id, references(:people)
      add :work_id, references(:works)

      timestamps()
    end
  end
end
