defmodule GodzillaCineaste.Repo.Migrations.UndoChangesToPeopleAndGroups do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :slug, :string
      add :display_name, :string
      add :sort_name, :string
      add :showcased, :boolean, default: false, null: false
      add :tenant, :integer
      add :disambig_chars, :string
      add :profession, :string
      add :avatar_url, :string
      add :dob, :map
      add :dod, :map
      timestamps()
    end

    create table(:groups) do
      add :slug, :string
      add :display_name, :string
      add :sort_name, :string
      add :showcased, :boolean, default: false, null: false
      add :tenant, :integer
      add :profession, :string
      add :avatar_url, :string
      timestamps()
    end

    create unique_index(:people, [:slug])
    create unique_index(:groups, [:slug])

    alter table(:roles) do
      add :person_id, references(:people)
      add :group_id, references(:groups)
    end

    alter table(:staff) do
      add :person_id, references(:people)
      add :group_id, references(:groups)
    end

    alter table(:kaiju_roles) do
      add :person_id, references(:people)
    end

    alter table(:author_works) do
      add :person_id, references(:people)
    end
  end
end
