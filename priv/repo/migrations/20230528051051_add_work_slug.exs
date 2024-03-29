defmodule GodzillaCineaste.Repo.Migrations.AddWorkSlug do
  use Ecto.Migration

  def change do
    alter table(:works) do
      add :slug, :string
    end

    create unique_index(:works, [:slug])
  end
end
