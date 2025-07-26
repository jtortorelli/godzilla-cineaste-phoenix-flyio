defmodule GodzillaCineaste.Films do
  @moduledoc false

  import Ecto.Query

  alias GodzillaCineaste.Film
  alias GodzillaCineaste.FilmCredits
  alias GodzillaCineaste.FilmSeries
  alias GodzillaCineaste.Repo

  alias NimbleCSV.RFC4180, as: CSV

  def get_film(slug) do
    Repo.get_by!(Film, slug: slug)
  end

  def get_film_credits(slug) do
    Repo.get_by!(FilmCredits, slug: slug)
    |> Map.get(:credits)
    |> CSV.parse_string(skip_headers: false)
  rescue
    Ecto.NoResultsError -> nil
  end

  def get_film_series(slug) do
    Repo.get_by!(FilmSeries, slug: slug)
  end

  def list_films(search_terms \\ []) do
    from(f in Film, where: f.showcased, order_by: f.sort_title)
    |> maybe_filter_by_search_terms(search_terms)
    |> dbg()
    |> Repo.all()
  end

  defp maybe_filter_by_search_terms(query, []) do
    query
  end

  defp maybe_filter_by_search_terms(query, search_terms) do
    where(
      query,
      [f],
      fragment(
        """
        UNACCENT(LOWER(? ->> 'title')) ~* ALL(?)
        OR
        EXISTS (
          SELECT 1
          FROM jsonb_array_elements(? -> 'aliases') AS alias
          WHERE UNACCENT(LOWER(alias ->> 'alias')) ~* ALL(?)
        )
        """,
        f.document,
        ^search_terms,
        f.document,
        ^search_terms
      )
    )
  end
end
