defmodule GodzillaCineaste.Films do
  @moduledoc false

  import Ecto.Query

  alias CineasteData.{
    Film,
    FilmSeries,
    FilmSeriesEntry,
    KaijuRole,
    Repo,
    Role,
    Staff
  }

  def get_adjacent_films_in_series(%Film{
        series_entry: %FilmSeriesEntry{
          entry_number: entry_number,
          film_series: %FilmSeries{id: film_series_id}
        }
      }) do
    with previous_film <- get_film_series_entry(film_series_id, entry_number - 1),
         next_film <- get_film_series_entry(film_series_id, entry_number + 1) do
      {:ok, previous_film, next_film}
    end
  end

  def get_adjacent_films_in_series(_), do: {:ok, nil, nil}

  def get_film_by_slug!(slug) do
    Film
    |> Repo.get_by!(slug: slug)
    |> Repo.preload(
      studios: [],
      production_committee: [:studios],
      works: [:authors, :studios],
      series_entry: [film_series: [entries: :film]],
      synopsis: [],
      credits: [],
      kaiju_roles: {from(kr in KaijuRole, order_by: [kr.order]), [:person, :kaiju_character]},
      roles: {from(r in Role, order_by: [r.order]), [:person, :group]},
      staff: {from(s in Staff, order_by: [s.order]), [:person, :group]}
    )
  end

  def get_film_series_entry(film_series_id, entry_number) do
    Film
    |> join(:left, [f], se in assoc(f, :series_entry))
    |> join(:left, [_f, se], fs in assoc(se, :film_series))
    |> where([_f, _se, fs], fs.id == ^film_series_id)
    |> where([_f, se, _fs], se.entry_number == ^entry_number)
    |> Repo.one()
  end

  def list_films do
    Film
    |> from()
    |> where([f], f.showcased)
    |> order_by([f], f.sort_title)
    |> Repo.all()
  end
end
