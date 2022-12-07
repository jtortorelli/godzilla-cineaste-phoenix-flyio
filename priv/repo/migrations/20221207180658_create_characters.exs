defmodule GodzillaCineaste.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :slug, :string
      add :display_name, :string
      add :showcased, :boolean, default: false, null: false
      add :tenant, :integer

      timestamps()
    end
  end
end
