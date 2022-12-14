defmodule GodzillaCineasteWeb.FilmController do
  use GodzillaCineasteWeb, :controller

  alias GodzillaCineaste.Films

  def index(conn, _params) do
    with films <- Films.list_films() do
      render(conn, :index, page_title: "Films", films: films)
    end
  end

  def show(conn, %{"slug" => slug}) do
    with film <- Films.get_film_by_slug!(slug),
         {:ok, previous_film, next_film} <- Films.get_adjacent_films_in_series(film) do
      render(conn, :show,
        page_title: film.title,
        film: film,
        previous_series_film: previous_film,
        next_series_film: next_film
      )
    end
  end
end
