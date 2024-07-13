defmodule GodzillaCineaste.Repo.Migrations.AddGroupMembers do
  use Ecto.Migration

  def change do
    create table(:group_members) do
      add :group_id, references(:groups)
      add :person_id, references(:people)

      timestamps()
    end
  end
end
