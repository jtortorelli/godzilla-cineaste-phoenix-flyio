defmodule GodzillaCineaste.Repo.Migrations.AddPeopleRelationships do
  use Ecto.Migration

  def change do
    create table(:relationships) do
      add :self_id, references(:people)
      add :relative_id, references(:people)
      add :relationship, :string, null: false
      add :order, :integer, default: 0

      timestamps()
    end

    create unique_index(:relationships, [:self_id, :relative_id])
  end
end
