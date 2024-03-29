defmodule GodzillaCineaste.Repo.Migrations.CreateFilmSeries do
  use Ecto.Migration

  def change do
    create table(:film_series) do
      add :slug, :string
      add :name, :string

      timestamps()
    end
  end
end
