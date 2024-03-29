defmodule GodzillaCineaste.Repo.Migrations.AddKaijuVariants do
  use Ecto.Migration

  def change do
    create table(:kaiju_variants) do
      add :slug, :string
      add :display_name, :string
      add :kaiju_character_id, references(:kaiju_characters)

      timestamps()
    end

    alter table(:kaiju_variants) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    create unique_index(:kaiju_variants, [:slug])

    alter table(:kaiju_roles) do
      add :kaiju_variant_id, references(:kaiju_variants)
    end
  end
end
