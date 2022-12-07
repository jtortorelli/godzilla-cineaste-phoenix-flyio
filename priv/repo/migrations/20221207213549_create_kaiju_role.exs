defmodule GodzillaCineaste.Repo.Migrations.CreateKaijuRole do
  use Ecto.Migration

  def change do
    create table(:kaiju_role) do
      add :name, :string
      add :order, :string
      add :qualifiers, {:array, :string}
      add :uncredited, :boolean, default: false, null: false
      add :avatar_url, :string
      add :actor_alias, :string
      add :person_id, references(:people)
      add :film_id, references(:films)
      add :kaiju_character_id, references(:kaiju_characters)

      timestamps()
    end
  end
end
