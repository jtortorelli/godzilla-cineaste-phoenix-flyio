alias NimbleCSV.RFC4180, as: CSV

import Ecto.Query

alias GodzillaCineaste.{Award, AwardCeremony, Film, Person, Repo}

mainichi_film_award = Repo.get_by!(Award, name: "Mainichi Film Award")

person_search_query = fn search_term ->
  from p in Person,
    where:
      ilike(fragment("unaccent(?)", p.japanese_name), fragment("unaccent(?)", ^search_term)) or
        p.id in subquery(
          Person
          |> from()
          |> join(:cross, [p], a in fragment("jsonb_array_elements(?)", p.alternate_names))
          |> where(
            [p, a],
            fragment("unaccent(? ->> 'japanese_name') ilike unaccent(?)", a, ^search_term)
          )
          |> select([p, a], p.id)
        )
end

film_search_query = fn search_term ->
  from f in Film,
    where:
      f.id in subquery(
        Film
        |> from()
        |> where([f], fragment("? ->> 'original' = ?", f.original_title, ^search_term))
        |> select([f], f.id)
      )
end

"priv/scripts/mainichi_film_concours.csv"
|> File.read!()
|> CSV.parse_string()
|> Enum.flat_map(fn [_ordinals, _year, _category, _order, _people, films, _original] ->
  case films do
    "" ->
      []

    _ ->
      films
      |> String.split(",")

      # |> Enum.map(fn p -> p |> person_search_query.() |> Repo.one() end)
      # |> Enum.flat_map(fn p -> if is_binary(p), do: [], else: [p] end)
  end
end)
|> Enum.uniq()
|> Enum.reject(fn f -> f |> film_search_query.() |> Repo.exists?() end)
|> Enum.each(&IO.puts(&1))
|> IO.inspect()
