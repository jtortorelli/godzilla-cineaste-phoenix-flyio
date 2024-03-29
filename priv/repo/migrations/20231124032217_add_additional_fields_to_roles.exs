defmodule GodzillaCineaste.Repo.Migrations.AddAdditionalFieldsToRoles do
  use Ecto.Migration

  def change do
    alter table(:roles) do
      add :mergeable, :boolean, default: false
      add :role_qualifiers, :string
      add :character_qualifiers, :string
    end
  end
end
