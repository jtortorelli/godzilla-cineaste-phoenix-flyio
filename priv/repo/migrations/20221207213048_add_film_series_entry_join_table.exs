defmodule GodzillaCineaste.Repo.Migrations.AddFilmSeriesEntryJoinTable do
  use Ecto.Migration

  def change do
    create table(:film_series_entries) do
      add :entry_number, :integer
      add :film_id, references(:films)
      add :film_series_id, references(:film_series)

      timestamps()
    end
  end
end
