defmodule GodzillaCineasteWeb.FilmComponents do
  use GodzillaCineasteWeb, :html

  attr :film, CineasteData.Film, required: true

  def display_title(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <%= if Enum.empty?(@film.display_title) do %>
        <h1 class="font-display tracking-wider uppercase p-2 text-2xl">
          <%= raw(process_title(@film.title)) %>
        </h1>
      <% else %>
        <h1>
          <%= for %{style: style, content: content} <- @film.display_title do %>
            <%= if style == :title do %>
              <span class="font-display tracking-wide uppercase p-2 text-2xl">
                <%= raw(process_title(content)) %>
              </span>
              <br />
            <% end %>
            <%= if style == :subtitle do %>
              <span class="font-display font-extrabold tracking-[.2em] uppercase p-2 text-base text-gray-500">
                <%= raw(process_title(content)) %>
              </span>
              <br />
            <% end %>
          <% end %>
        </h1>
      <% end %>
    </div>
    """
  end

  attr :film, CineasteData.Film, required: true

  def primary_poster(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <img
        class="rounded-lg drop-shadow-lg"
        height="400"
        width="270"
        src={Enum.find_value(@film.poster_urls, fn pu -> if pu.primary, do: pu.url end)}
      />
    </div>
    """
  end

  attr :film, CineasteData.Film, required: true

  def specs(assigns) do
    ~H"""
    <div class="text-gray-700 font-content flex justify-center space-x-8">
      <div><%= "#{@film.runtime}m" %></div>
      <div><%= Timex.format!(@film.release_date, "{D} {Mshort} {YYYY}") %></div>
    </div>
    """
  end

  attr :film, CineasteData.Film, required: true

  def studios_or_production_committee(assigns) do
    ~H"""
    <div>
      <div class="text-center font-mono uppercase text-xs text-gray-500">A Production Of</div>
      <%= if @film.production_committee do %>
        <div class="font-content text-gray-700 text-center">
          <%= @film.production_committee.display_name %>
        </div>
      <% else %>
        <div class="font-content text-center text-gray-700">
          <%= Enum.map_join(@film.studios, ", ", & &1.display_name) %>
        </div>
      <% end %>
    </div>
    """
  end

  attr :film, CineasteData.Film, required: true

  def original_title(assigns) do
    ~H"""
    <div class="text-center">
      <div class="font-mono text-xs text-gray-500 uppercase">Original Title</div>
      <div class="space-y-1">
        <div class="font-serif tracking-wide text-gray-700">
          <%= @film.original_title.original %>
        </div>
        <div class="font-mono italic text-xs text-gray-500">
          <%= @film.original_title.transliteration %>
        </div>
        <%= if @film.original_title.transliteration != @film.original_title.translation do %>
          <div class="font-mono italic text-xs text-gray-500">
            <%= @film.original_title.translation %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  attr :film, CineasteData.Film, required: true

  def works(assigns) do
    ~H"""
    <%= if @film.works do %>
      <%= for work <- @film.works do %>
        <div class="text-center">
          <div class="uppercase font-mono text-xs text-gray-500">
            <%= "based on the #{work.format}" %>
          </div>
          <div class="font-content italic text-gray-700"><%= work.title %></div>
          <%= if Enum.empty?(work.authors) do %>
            <div class="font-content text-gray-700">
              <span class="uppercase font-mono text-xs text-gray-500">by</span>
              <%= "#{Enum.map_join(work.studios, ", ", & &1.display_name)}" %>
            </div>
          <% else %>
            <div class="font-content text-gray-700">
              <span class="uppercase font-mono text-xs text-gray-500">by</span>
              <%= "#{Enum.map_join(work.authors, ", ", & &1.display_name)}" %>
            </div>
          <% end %>
        </div>
      <% end %>
    <% end %>
    """
  end

  attr :film, CineasteData.Film, required: true

  def aliases(assigns) do
    ~H"""
    <%= if not Enum.empty?(@film.aliases) do %>
      <div>
        <div class="uppercase font-mono text-center text-xs text-gray-500">
          also known as
        </div>
        <%= for alias <- @film.aliases do %>
          <div>
            <div class="text-center font-content italic"><%= alias.title %></div>
            <div class="text-center font-mono text-xs text-gray-500">
              <%= alias.context %>
            </div>
          </div>
        <% end %>
      </div>
    <% end %>
    """
  end

  attr :film, CineasteData.Film
  attr :direction, :atom, values: [:next, :prev], required: true

  def series_film_info(assigns) do
    ~H"""
    <%= if @film do %>
      <div class="flex justify-between items-center my-2 w-96">
        <div class="w-6">
          <%= if @direction == :prev do %>
            <.link href={~p"/films/#{@film.slug}"}>
              <.icon name="hero-arrow-left-circle" class="h-6 w-6" />
            </.link>
          <% end %>
        </div>
        <div class="text-center font-content">
          <.link href={~p"/films/#{@film.slug}"}>
            <span class="italic"><%= @film.title %></span>
            <span class="text-sm">(<%= @film.release_date.year %>)</span>
          </.link>
        </div>
        <div class="w-6">
          <%= if @direction == :next do %>
            <.link href={~p"/films/#{@film.slug}"}>
              <.icon name="hero-arrow-right-circle" class="h-6 w-6" />
            </.link>
          <% end %>
        </div>
      </div>
    <% end %>
    """
  end

  attr :film, CineasteData.Film, required: true
  attr :previous_series_film, CineasteData.Film
  attr :next_series_film, CineasteData.Film

  def series_info(assigns) do
    ~H"""
    <%= if @film.series_entry do %>
      <div>
        <div class="uppercase font-mono text-center text-xs text-gray-500">
          <%= "#{@film.series_entry.film_series.name} no. #{@film.series_entry.entry_number}" %>
        </div>
        <div class="w-fit m-auto text-red-700">
          <.series_film_info film={@previous_series_film} direction={:prev} />
          <.series_film_info film={@next_series_film} direction={:next} />
        </div>
      </div>
    <% end %>
    """
  end

  attr :film, CineasteData.Film, required: true
  attr :previous_series_film, CineasteData.Film
  attr :next_series_film, CineasteData.Film

  def overview(assigns) do
    ~H"""
    <div class="inline-flex items-center justify-center w-full">
      <hr class="w-96 h-px my-8 border-0 rounded bg-red-700" />
      <span class="absolute px-3 font-mono text-sm uppercase text-red-700 -translate-x-1/2 bg-white left-1/2">
        Overview
      </span>
    </div>
    <div class="space-y-4">
      <.primary_poster film={@film} />
      <.specs film={@film} />
      <.studios_or_production_committee film={@film} />
      <.original_title film={@film} />
      <.works film={@film} />
      <.aliases film={@film} />
      <.series_info
        film={@film}
        previous_series_film={@previous_series_film}
        next_series_film={@next_series_film}
      />
    </div>
    """
  end

  defp process_title(title) do
    title
    |> String.replace("20th", "20<span class=\"align-top text-lg\">th</span>")
    |> String.replace("3rd", "3<span class=\"align-top text-lg\">rd</span>")
  end
end
