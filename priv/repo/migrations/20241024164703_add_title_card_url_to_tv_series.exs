defmodule GodzillaCineaste.Repo.Migrations.AddTitleCardUrlToTvSeries do
  use Ecto.Migration

  def change do
    alter table(:tv_series) do
      add :title_card_url, :string
    end
  end
end
