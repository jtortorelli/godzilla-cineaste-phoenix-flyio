defmodule GodzillaCineaste.Repo.Migrations.AddProductionCommittees do
  use Ecto.Migration

  def change do
    create table(:production_committees) do
      add :slug, :string
      add :display_name, :string

      timestamps()
    end

    create unique_index(:production_committees, [:slug])

    create table(:production_committee_studios) do
      add :studio_id, references(:studios)
      add :production_committee_id, references(:production_committees)
      timestamps()
    end

    alter table(:films) do
      add :production_committee, references(:production_committees)
    end
  end
end
