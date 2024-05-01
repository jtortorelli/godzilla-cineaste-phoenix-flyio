defmodule GodzillaCineaste.Repo.Migrations.AddAlternateNamesToPeople do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :alternate_names, :map, default: "[]"
    end
  end
end
