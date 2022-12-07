defmodule GodzillaCineaste.FilmSeriesEntry do
  use Ecto.Schema

  alias GodzillaCineaste.{Film, FilmSeries}

  schema "film_series_entries" do
    field :entry_number, :integer

    belongs_to :film_series, FilmSeries
    belongs_to :film, Film
    timestamps()
  end
end
