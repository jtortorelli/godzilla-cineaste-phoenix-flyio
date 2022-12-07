defmodule GodzillaCineaste.Repo.Migrations.CreateFilms do
  use Ecto.Migration

  def change do
    create table(:films) do
      add :slug, :string
      add :title, :string
      add :release_date, :date
      add :runtime, :integer
      add :showcased, :boolean, default: false, null: false
      add :tenant, :integer
      add :sort_title, :text

      timestamps()
    end
  end
end
