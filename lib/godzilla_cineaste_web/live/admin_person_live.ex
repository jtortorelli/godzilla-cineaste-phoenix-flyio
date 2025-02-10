defmodule GodzillaCineasteWeb.AdminPersonLive do
  use GodzillaCineasteWeb, :live_view

  alias GodzillaCineaste.People

  def mount(%{"slug" => slug}, _session, socket) do
    person = People.get_person_by_slug!(slug)
    {:ok, assign(socket, person: person), layout: {GodzillaCineasteWeb.Layouts, :admin}}
  end
end
