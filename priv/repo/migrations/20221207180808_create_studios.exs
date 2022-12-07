defmodule GodzillaCineaste.Repo.Migrations.CreateStudios do
  use Ecto.Migration

  def change do
    create table(:studios) do
      add :slug, :string
      add :name, :string

      timestamps()
    end
  end
end
