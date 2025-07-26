defmodule GodzillaCineaste.People do
  import Ecto.Query
  alias GodzillaCineaste.Person
  alias GodzillaCineaste.Repo

  def get_person(slug) do
    Repo.get_by!(Person, slug: slug)
  end

  def list_people(search_terms \\ []) do
    from(p in Person, where: p.showcased, order_by: p.sort_name)
    |> maybe_filter_by_search_terms(search_terms)
    |> Repo.all()
  end

  defp maybe_filter_by_search_terms(query, []) do
    query
  end

  defp maybe_filter_by_search_terms(query, search_terms) do
    where(
      query,
      [p],
      fragment(
        """
        UNACCENT(LOWER(? ->> 'name')) ~* ALL(?)
        OR
        UNACCENT(LOWER(? ->> 'birth_name')) ~* ALL(?)
        OR
        EXISTS (
          SELECT 1
          FROM jsonb_array_elements(COALESCE(? -> 'aliases', '[]'::jsonb)) AS alias
          WHERE UNACCENT(LOWER(alias ->> 'name')) ~* ALL(?)
        )
        OR
        EXISTS (
          SELECT 1
          FROM jsonb_array_elements(COALESCE(? -> 'members', '[]'::jsonb)) AS member
          WHERE UNACCENT(LOWER(member ->> 'name')) ~* ALL(?)
        )
        """,
        p.document,
        ^search_terms,
        p.document,
        ^search_terms,
        p.document,
        ^search_terms,
        p.document,
        ^search_terms
      )
    )
  end
end
