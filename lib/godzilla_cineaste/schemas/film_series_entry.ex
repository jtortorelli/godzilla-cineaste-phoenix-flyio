defmodule GodzillaCineaste.FilmSeriesEntry do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, FilmSeries}

  schema "film_series_entries" do
    field :entry_number, :integer

    belongs_to :film_series, FilmSeries
    belongs_to :film, Film
    timestamps()
  end

  def changeset(film_series_entry, attrs) do
    film_series_entry
    |> cast(attrs, [:film_series_id, :film_id, :entry_number])
    |> validate_required([:film_series_id, :film_id, :entry_number])
    |> assoc_constraint(:film)
    |> assoc_constraint(:film_series)
  end
end
