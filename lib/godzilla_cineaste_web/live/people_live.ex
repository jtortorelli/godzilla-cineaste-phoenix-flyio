defmodule GodzillaCineasteWeb.PeopleLive do
  use GodzillaCineasteWeb, :live_view

  alias GodzillaCineaste.{Entities}

  def mount(_params, _session, socket) do
    people = Entities.list_entities()
    {:ok, assign(socket, people: people)}
  end

  def handle_event("people_search_change", %{"value" => _value}, socket) do
    {:noreply, socket}
  end

  def display_person_date_range(person) do
    Entities.display_date_range(person)
  end
end
