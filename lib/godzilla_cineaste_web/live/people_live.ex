defmodule GodzillaCineasteWeb.PeopleLive do
  use GodzillaCineasteWeb, :live_view

  alias GodzillaCineaste.People

  def mount(_params, _session, socket) do
    people = People.list_people()
    {:ok, assign(socket, people: people)}
  end

  def handle_event("people_search_change", %{"value" => _value}, socket) do
    {:noreply, socket}
  end
end
