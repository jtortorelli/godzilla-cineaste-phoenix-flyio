defmodule GodzillaCineaste.Repo.Migrations.AddProfessionToEntities do
  use Ecto.Migration

  def change do
    alter table(:entities) do
      add :profession, :string
    end
  end
end
