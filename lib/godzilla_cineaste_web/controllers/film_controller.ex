defmodule GodzillaCineasteWeb.FilmController do
  use GodzillaCineasteWeb, :controller

  alias GodzillaCineaste.{Films, Group, Person}

  def index(conn, _params) do
    with films <- Films.list_films() do
      render(conn, :index, page_title: "Films", films: films)
    end
  end

  def show(conn, %{"slug" => slug}) do
    with film <- Films.get_film_by_slug!(slug),
         {:ok, previous_film, next_film} <- Films.get_adjacent_films_in_series(film) do
      {top_billed_roles, rest_of_roles} =
        Enum.split_with(film.roles, fn role -> role.top_billed end)

      rest_of_roles =
        Enum.sort_by(rest_of_roles, fn
          %{person: %Person{sort_name: sort_name}} -> sort_name
          %{group: %Group{sort_name: sort_name}} -> sort_name
        end)

      render(conn, :show,
        page_title: film.title,
        film: film,
        previous_series_film: previous_film,
        next_series_film: next_film,
        top_billed_roles: top_billed_roles,
        rest_of_roles: rest_of_roles
      )
    end
  end
end
