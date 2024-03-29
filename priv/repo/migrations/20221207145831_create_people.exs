defmodule GodzillaCineaste.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :slug, :string
      add :display_name, :string
      add :sort_name, :string
      add :showcased, :boolean, default: false, null: false
      add :tenant, :integer

      timestamps()
    end
  end
end
