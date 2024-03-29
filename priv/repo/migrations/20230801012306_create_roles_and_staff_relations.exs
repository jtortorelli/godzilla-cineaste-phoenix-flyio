defmodule GodzillaCineaste.Repo.Migrations.CreateRolesAndStaffRelations do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :actor_alias, :string
      add :avatar_url, :string
      add :description, :string
      add :name, :string
      add :order, :integer
      add :uncredited, :boolean, default: false
      add :qualifiers, {:array, :string}, default: []
      add :title, :string

      add :film_id, references(:films)
      add :character_id, references(:characters)
      add :person_id, references(:people)
      add :group_id, references(:groups)

      timestamps()
    end

    create table(:staff) do
      add :order, :integer
      add :role, :string
      add :staff_alias, :string

      add :film_id, references(:films)
      add :person_id, references(:people)
      add :group_id, references(:groups)

      timestamps()
    end
  end
end
