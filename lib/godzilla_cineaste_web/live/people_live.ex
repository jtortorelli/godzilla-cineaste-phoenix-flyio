defmodule GodzillaCineasteWeb.PeopleLive do
  use GodzillaCineasteWeb, :live_view

  alias GodzillaCineaste.{People, Person}

  def mount(_params, _session, socket) do
    people = People.list_people()
    {:ok, assign(socket, people: people)}
  end

  def handle_event("people_search_change", %{"value" => _value}, socket) do
    {:noreply, socket}
  end

  def display_person_date_range(person) do
    Person.display_date_range(person)
  end
end
