defmodule GodzillaCineaste.Repo.Migrations.AddEntitiesSchema do
  use Ecto.Migration

  def change do
    create table(:entities) do
      add :display_name, :string
      add :showcased, :boolean, default: false
      add :slug, :string
      add :sort_name, :string
      add :tenant, :integer
      add :avatar_url, :string
      add :type, :string
      add :metadata, :map
      timestamps()
    end

    create unique_index(:entities, [:slug])
  end
end
