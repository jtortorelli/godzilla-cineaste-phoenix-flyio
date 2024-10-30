defmodule GodzillaCineaste.Repo.Migrations.AddPeopleTrivia do
  use Ecto.Migration

  def change do
    create table(:people_trivia) do
      add :person_id, references(:people)
      add :trivia, :jsonb, default: "[]"

      timestamps()
    end

    create unique_index(:people_trivia, [:person_id])
  end
end
