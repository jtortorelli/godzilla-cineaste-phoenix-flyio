defmodule GodzillaCineaste.Repo.Migrations.RefactorToLeverageEntities do
  use Ecto.Migration

  def change do
    alter table(:author_works) do
      add :entity_id, references(:entities)
    end

    alter table(:kaiju_roles) do
      add :entity_id, references(:entities)
    end

    alter table(:roles) do
      add :entity_id, references(:entities)
    end

    alter table(:staff) do
      add :entity_id, references(:entities)
    end
  end
end
