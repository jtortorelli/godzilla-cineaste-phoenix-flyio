defmodule GodzillaCineaste.Library do
  use GenServer

  alias NimbleCSV.RFC4180, as: CSV

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def get_film(slug) do
    case :ets.lookup(:films, slug) do
      [{_, film}] -> {:ok, film}
      [] -> {:error, :not_found}
    end
  end

  def get_film_credits(slug) do
    case :ets.lookup(:film_credits, slug) do
      [{_, credits}] -> credits
      _ -> nil
    end
  end

  def get_film_series(slug) do
    case :ets.lookup(:film_series, slug) do
      [{_, series}] -> series
      _ -> nil
    end
  end

  def get_person(slug) do
    case :ets.lookup(:people, slug) do
      [{_, person}] -> {:ok, person}
      [] -> {:error, :not_found}
    end
  end

  def list_films(search_terms \\ []) do
    :films
    |> :ets.tab2list()
    |> Enum.filter(fn {_slug, film} ->
      case search_terms do
        [] ->
          true

        [_ | _] ->
          title = film["title"]
          aliases = Enum.map(film["aliases"] || [], & &1["alias"])

          values = [title | aliases]

          Enum.all?(search_terms, fn term ->
            Enum.any?(values, &contains_search_term?(&1, term))
          end)
      end
    end)
    |> Enum.sort_by(fn {slug, _} -> slug end)
    |> Enum.map(fn {slug, film} -> Map.put(film, "slug", slug) end)
  end

  def list_people(search_terms \\ []) do
    :people
    |> :ets.tab2list()
    |> Enum.filter(fn {_slug, person} ->
      case search_terms do
        [] ->
          true

        [_ | _] ->
          name = person["name"]
          birth_name = person["birth_name"]
          members = Enum.map(person["members"] || [], & &1["name"])
          aliases = Enum.map(person["aliases"] || [], & &1["alias"])

          values = [name, birth_name | aliases ++ members] |> Enum.reject(&is_nil/1)

          Enum.all?(search_terms, fn term ->
            Enum.any?(values, &contains_search_term?(&1, term))
          end)
      end
    end)
    |> Enum.sort_by(fn {slug, _} -> slug end)
    |> Enum.map(fn {slug, person} -> Map.put(person, "slug", slug) end)
  end

  defp unaccent_term(term) do
    term |> String.normalize(:nfd) |> String.replace(~r/\p{Mn}/u, "")
  end

  defp prep_term(term) do
    term |> unaccent_term() |> String.downcase()
  end

  def contains_search_term?(value, search_term) do
    String.contains?(prep_term(value), prep_term(search_term))
  end

  def init(_) do
    initialize_film_cache()
    initialize_film_credits_cache()
    initialize_film_series_cache()
    initialize_people_cache()
    {:ok, []}
  end

  defp initialize_film_cache do
    :ets.new(:films, [:set, :protected, :named_table])

    "./data/films/**/*.yml"
    |> Path.wildcard()
    |> Enum.sort()
    |> Enum.map(fn path ->
      :ets.insert(:films, {Path.basename(path, ".yml"), YamlElixir.read_from_file!(path)})
    end)
  end

  defp initialize_film_credits_cache do
    :ets.new(:film_credits, [:set, :protected, :named_table])

    "./data/credits/**/*.csv"
    |> Path.wildcard()
    |> Enum.sort()
    |> Enum.map(fn path ->
      path
      |> File.read!()
      |> CSV.parse_string(skip_headers: false)
      |> then(&:ets.insert(:film_credits, {Path.basename(path, ".csv"), &1}))
    end)
  end

  defp initialize_film_series_cache do
    :ets.new(:film_series, [:set, :protected, :named_table])

    "./data/series/**/*.yml"
    |> Path.wildcard()
    |> Enum.sort()
    |> Enum.map(fn path ->
      :ets.insert(:film_series, {Path.basename(path, ".yml"), YamlElixir.read_from_file!(path)})
    end)
  end

  defp initialize_people_cache do
    :ets.new(:people, [:set, :protected, :named_table])

    "./data/people/**/*.yml"
    |> Path.wildcard()
    |> Enum.sort()
    |> Enum.map(fn path ->
      :ets.insert(:people, {Path.basename(path, ".yml"), YamlElixir.read_from_file!(path)})
    end)
  end
end
