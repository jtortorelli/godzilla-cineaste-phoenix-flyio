defmodule GodzillaCineasteWeb.AdminPeopleLive do
  use GodzillaCineasteWeb, :live_view

  import GodzillaCineasteWeb.CoreComponents

  alias GodzillaCineaste.Admin

  def mount(_params, _session, socket) do
    people = Admin.list_people()
    search_form = %{"search" => "", "showcased" => "all"}

    {:ok, assign(socket, people: people, search_form: search_form),
     layout: {GodzillaCineasteWeb.Layouts, :admin}}
  end

  def handle_event("search_terms_changed", params, socket) do
    people = Admin.list_people(params)
    {:noreply, assign(socket, people: people)}
  end
end
