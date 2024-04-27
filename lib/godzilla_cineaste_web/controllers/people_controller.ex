defmodule GodzillaCineasteWeb.PeopleController do
  use GodzillaCineasteWeb, :controller

  alias GodzillaCineaste.People

  def show(conn, %{"slug" => slug}) do
    entity = People.get_entity_by_slug!(slug)

    render(conn, :show, entity: entity, page_title: entity.display_name)
  end
end
