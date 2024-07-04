defmodule GodzillaCineasteWeb.PeopleController do
  use GodzillaCineasteWeb, :controller

  alias GodzillaCineaste.{Group, People, Person}

  def show(conn, %{"slug" => slug}) do
    entity = People.get_entity_by_slug!(slug)
    selected_filmography = People.get_selected_filmography_by_entity!(entity)

    case entity do
      %Person{} ->
        render(conn, "show_person.html",
          person: entity,
          selected_filmography: selected_filmography,
          page_title: entity.display_name
        )

      %Group{} ->
        render(conn, "show_group.html",
          group: entity,
          selected_filmography: selected_filmography,
          page_title: entity.display_name
        )
    end
  end
end
