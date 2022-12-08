defmodule GodzillaCineaste.Repo.Migrations.CreatePersonRoles do
  use Ecto.Migration

  def change do
    create table(:person_roles) do
      add :name, :string
      add :order, :string
      add :qualifiers, {:array, :string}
      add :uncredited, :boolean, default: false, null: false
      add :avatar_url, :string
      add :actor_alias, :string
      add :person_id, references(:people)
      add :film_id, references(:films)
      add :character_id, references(:characters)

      timestamps()
    end
  end
end
