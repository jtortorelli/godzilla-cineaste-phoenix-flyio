defmodule GodzillaCineaste.Repo.Migrations.AddTvSeriesMainStaff do
  use Ecto.Migration

  def change do
    create table(:tv_series_main_staff) do
      add :role, :string
      add :order, :integer
      add :tv_series_id, references(:tv_series)
      add :person_id, references(:people)

      timestamps()
    end
  end
end
