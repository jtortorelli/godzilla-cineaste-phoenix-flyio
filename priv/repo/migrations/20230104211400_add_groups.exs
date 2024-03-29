defmodule GodzillaCineaste.Repo.Migrations.AddGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :slug, :string
      add :display_name, :string
      add :sort_name, :string
      add :showcased, :boolean, default: false, null: false
      add :tenant, :integer

      timestamps()
    end

    alter table(:groups) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    create unique_index(:groups, [:slug])

    create table(:group_roles) do
      add :name, :string
      add :order, :string
      add :avatar_url, :string
      add :group_id, references(:groups)
      add :film_id, references(:films)
      add :character_id, references(:characters)

      timestamps()
    end

    alter table(:group_roles) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    create table(:group_staff) do
      add :role, :string
      add :order, :string
      add :film_id, references(:films)
      add :group_id, references(:groups)

      timestamps()
    end

    alter table(:group_staff) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    create unique_index(:group_staff, [:film_id, :group_id, :role])
  end
end
