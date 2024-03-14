defmodule GodzillaCineasteWeb.FilmsLive do
  use GodzillaCineasteWeb, :live_view

  import GodzillaCineasteWeb.{CoreComponents, FilmComponents}

  alias GodzillaCineaste.Films

  def mount(_params, _session, socket) do
    films = Films.list_films()
    {:ok, assign(socket, films: films)}
  end

  def handle_event("film_search_change", %{"value" => value}, socket) do
    search_term =
      value
      |> String.trim()
      |> String.replace_prefix("", "%")
      |> String.replace_suffix("", "%")

    films = Films.list_films(search_term)
    {:noreply, assign(socket, films: films)}
  end
end
