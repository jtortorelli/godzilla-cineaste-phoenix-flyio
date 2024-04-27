defmodule GodzillaCineaste.Repo.Migrations.AddJapaneseNameToEntityTables do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :japanese_name, :string
    end

    alter table(:groups) do
      add :japanese_name, :string
    end
  end
end
