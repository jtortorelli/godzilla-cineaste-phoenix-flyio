defmodule GodzillaCineaste.Repo.Migrations.AddTvSeriesAndMainCast do
  use Ecto.Migration

  def change do
    create table(:tv_series) do
      add :first_air_date, :date
      add :last_air_date, :date
      add :showcased, :boolean, default: false
      add :slug, :string
      add :sort_title, :string
      add :tenant, :integer
      add :title, :string
      add :num_seasons, :integer

      timestamps()
    end

    create unique_index(:tv_series, [:slug])

    create table(:tv_series_main_cast) do
      add :name, :string
      add :order, :integer
      add :num_of_episodes, :integer
      add :tv_series_id, references(:tv_series)
      add :person_id, references(:people)
      timestamps()
    end
  end
end
