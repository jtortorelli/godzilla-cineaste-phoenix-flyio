defmodule GodzillaCineasteWeb.PeopleLive do
  use GodzillaCineasteWeb, :live_view

  alias GodzillaCineaste.{People, Person}

  def mount(_params, _session, socket) do
    people = People.list_people()
    {:ok, assign(socket, people: people, page_title: "People")}
  end

  def handle_event("people_search_change", %{"value" => value}, socket) do
    search_term =
      value
      |> String.trim()
      |> String.replace_prefix("", "%")
      |> String.replace_suffix("", "%")

    people = People.list_people(search_term)
    {:noreply, assign(socket, people: people)}
  end

  def display_person_date_range(person) do
    Person.display_date_range(person)
  end
end
