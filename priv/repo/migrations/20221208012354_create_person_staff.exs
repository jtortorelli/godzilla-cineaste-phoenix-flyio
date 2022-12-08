defmodule GodzillaCineaste.Repo.Migrations.CreatePersonStaff do
  use Ecto.Migration

  def change do
    create table(:person_staff) do
      add :role, :string
      add :order, :string
      add :film_id, references(:films)
      add :person_id, references(:people)

      timestamps()
    end
  end
end
