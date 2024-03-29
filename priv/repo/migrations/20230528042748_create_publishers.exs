defmodule GodzillaCineaste.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :slug, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:publishers, [:slug])
  end
end
