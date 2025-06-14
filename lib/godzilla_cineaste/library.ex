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

  def list_films() do
    :films
    |> :ets.tab2list()
    |> Enum.sort_by(fn {slug, _} -> slug end)
    |> Enum.map(fn {slug, film} -> Map.put(film, "slug", slug) end)
  end

  def init(_) do
    initialize_film_cache()
    initialize_film_credits_cache()
    initialize_film_series_cache()
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
end
