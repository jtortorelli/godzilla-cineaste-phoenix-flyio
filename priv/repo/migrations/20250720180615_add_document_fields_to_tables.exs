defmodule GodzillaCineaste.Repo.Migrations.AddDocumentFieldsToTables do
  use Ecto.Migration

  def change do
    alter table(:films) do
      add :document, :map, default: %{}
    end

    alter table(:people) do
      add :document, :map, default: %{}
    end

    alter table(:film_series) do
      add :document, :map, default: %{}
    end
  end
end
