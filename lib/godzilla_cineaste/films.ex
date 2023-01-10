defmodule GodzillaCineaste.Films do
  @moduledoc false

  import Ecto.Query

  alias CineasteData.{
    Film,
    FilmSeries,
    FilmSeriesEntry,
    GroupStaff,
    KaijuRole,
    PersonRole,
    PersonStaff,
    Repo
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
      work: [:authors],
      series_entry: [:film_series],
      synopsis: [],
      credits: [],
      person_staff: {from(ps in PersonStaff, order_by: ps.order), [:person]},
      person_roles:
        {from(pr in PersonRole, join: p in assoc(pr, :person), order_by: [pr.order, p.sort_name]),
         [:person]},
      kaiju_roles:
        {from(kr in KaijuRole, join: p in assoc(kr, :person), order_by: [kr.order, p.sort_name]),
         [:person, :kaiju_character]},
      group_staff: {from(gs in GroupStaff, order_by: gs.order), [:group]}
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
