defmodule GodzillaCineasteWeb.Films.IndexLive do
  use GodzillaCineasteWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, films: GodzillaCineaste.Films.list_films(), page_title: "Films")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <h1 class="font-display tracking-wider uppercase p-4 text-2xl text-gray-700">Films</h1>
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
          phx-keydown="film_search_change"
          phx-debounce="200"
        />
      </div>
    </div>
    <div>
      <div class="flex flex-col sm:flex-row sm:flex-wrap sm:items-start gap-4">
        <%= for film <- @films do %>
          <div class="sm:flex sm:flex-col sm:w-36 grid grid-cols-[101px_auto] gap-3">
            <div>
              <.link href={~p"/films/#{film.slug}"}>
                <div class="text-center w-fit m-auto">
                  <img
                    class="rounded-lg drop-shadow-lg"
                    height={150}
                    width={101}
                    src={film.document["poster_url"]}
                  />
                </div>
              </.link>
            </div>
            <div class="sm:text-center">
              <.link href={~p"/films/#{film.slug}"}>
                <div class="font-content italic text-sm text-gray-700">
                  {film.document["title"]}
                </div>
                <div class="font-detail text-red-700 text-xs">
                  {film.document["release_date"] |> Date.from_iso8601!() |> then(& &1.year)}
                </div>
              </.link>
            </div>
          </div>
        <% end %>
        <div></div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("film_search_change", %{"value" => value}, socket) do
    search_terms = value |> String.downcase() |> String.split(" ", trim: true)
    films = GodzillaCineaste.Films.list_films(search_terms)
    {:noreply, assign(socket, films: films)}
  end
end
