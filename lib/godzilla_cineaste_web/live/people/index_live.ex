defmodule GodzillaCineasteWeb.People.IndexLive do
  use GodzillaCineasteWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, people: GodzillaCineaste.People.list_people(), page_title: "People")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <h1 class="font-display tracking-wider uppercase p-4 text-2xl text-gray-700">People</h1>
    </div>
    <div class="pb-6">
      <div class="relative drop-shadow-lg">
        <div class="absolute inset-y-0 start-0 flex pl-4 items-center ps-3 pointer-events-none text-red-700">
          <.icon name="tabler-search" />
        </div>
        <input
          type="text"
          id="default-search"
          class="font-content block w-full p-4 pl-12 ps-10 text-base text-red-700 border-none rounded-lg"
          phx-keydown="people_search_change"
          phx-debounce="200"
        />
      </div>
    </div>
    <div class="flex flex-col sm:flex-row sm:flex-wrap justify-center gap-4">
      <%= for p <- @people do %>
        <div class="flex flex-row sm:flex-col sm:w-32 items-center gap-3">
          <div>
            <.link href={~p"/people/#{p["slug"]}"}>
              <img
                class="h-[100px] w-[100px]  max-w-[150px] rounded-lg drop-shadow-lg"
                src={p["avatar_url"]}
              />
            </.link>
          </div>
          <div class="sm:text-center">
            <.link href={~p"/people/#{p["slug"]}"}>
              <div class="font-content text-sm">
                {p["name"]}
              </div>
              <%= if p["profession"] do %>
                <div class="font-detail text-xs text-gray-500">{p["profession"]}</div>
              <% end %>
              <%= if p["type"] == "person" do %>
                <div class="font-detail text-xs text-red-700">
                  {display_person_date_range(p)}
                </div>
              <% end %>
            </.link>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  @impl true
  def handle_event("people_search_change", %{"value" => value}, socket) do
    search_terms = String.split(value, " ", trim: true)
    people = GodzillaCineaste.People.list_people(search_terms)
    {:noreply, assign(socket, people: people)}
  end

  defp display_person_date_range(%{"type" => "person"} = person) do
    birth_date = Map.get(person, "dob", nil)
    death_date = Map.get(person, "dod", nil)

    cond do
      birth_date && death_date && death_date != "unknown" ->
        "#{Date.from_iso8601!(birth_date).year}-#{Date.from_iso8601!(death_date).year}"

      birth_date && !death_date ->
        "b.#{Date.from_iso8601!(birth_date).year}"

      true ->
        nil
    end
  end

  defp display_person_date_range(_person) do
    nil
  end
end
