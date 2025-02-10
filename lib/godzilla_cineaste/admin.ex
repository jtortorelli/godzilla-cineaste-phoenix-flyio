defmodule GodzillaCineaste.Admin do
  alias GodzillaCineaste.{Person, Repo}

  import Ecto.Query

  def list_people(params \\ %{}) do
    dbg(params)

    Person
    |> from()
    |> where_search_term_matches(params)
    |> where_showcased_matches(params)
    |> order_by([p], p.sort_name)
    |> Repo.all()
  end

  defp where_search_term_matches(query, %{"search" => search}) do
    search_term =
      search
      |> String.trim()
      |> String.replace_prefix("", "%")
      |> String.replace_suffix("", "%")

    where(
      query,
      [p],
      fragment("unaccent(?) ILIKE unaccent(?)", p.display_name, ^"#{search_term}") or
        ilike(p.sort_name, ^"#{search_term}")
    )
  end

  defp where_search_term_matches(query, _params) do
    query
  end

  defp where_showcased_matches(query, %{"showcased" => showcased})
       when showcased in ["true", "false"] do
    where(query, [p], p.showcased == (^showcased == "true"))
  end

  defp where_showcased_matches(query, _params) do
    query
  end
end
