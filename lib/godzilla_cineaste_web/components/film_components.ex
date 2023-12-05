defmodule GodzillaCineasteWeb.FilmComponents do
  use GodzillaCineasteWeb, :html

  alias NimbleCSV.RFC4180, as: CSV

  alias CineasteData.{Film, Group, KaijuRole, Person, Role, Staff}

  attr :film, Film, required: true

  def display_title(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <%= if Enum.empty?(@film.display_title) do %>
        <h1 class="font-display tracking-wider uppercase p-2 text-2xl text-gray-700">
          <%= raw(process_title(@film.title)) %>
        </h1>
      <% else %>
        <h1>
          <%= for %{style: style, content: content} <- @film.display_title do %>
            <%= if style == :title do %>
              <span class="font-display tracking-wide uppercase p-2 text-2xl text-gray-700">
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

  attr :film, Film, required: true

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

  attr :film, Film, required: true

  def specs(assigns) do
    ~H"""
    <div class="text-gray-700 font-content flex justify-center space-x-8">
      <div><%= "#{@film.runtime}m" %></div>
      <div><%= Timex.format!(@film.release_date, "{D} {Mshort} {YYYY}") %></div>
    </div>
    """
  end

  attr :film, Film, required: true

  def studios_or_production_committee(assigns) do
    ~H"""
    <div>
      <div class="text-center font-detail uppercase text-xs text-gray-500">A Production Of</div>
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

  attr :film, Film, required: true

  def original_title(assigns) do
    ~H"""
    <div class="text-center">
      <div class="font-detail text-xs text-gray-500 uppercase">Original Title</div>
      <div class="space-y-1">
        <div class="font-serif tracking-wide text-gray-700">
          <%= @film.original_title.original %>
        </div>
        <div class="font-detail italic text-xs text-gray-500">
          <%= @film.original_title.transliteration %>
        </div>
        <%= if @film.original_title.transliteration != @film.original_title.translation do %>
          <div class="font-detail italic text-xs text-gray-500">
            <%= @film.original_title.translation %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  attr :film, Film, required: true

  def works(assigns) do
    ~H"""
    <%= if @film.works do %>
      <%= for work <- @film.works do %>
        <div class="text-center">
          <div class="uppercase font-detail text-xs text-gray-500">
            <%= "based on the #{work.format}" %>
          </div>
          <div class="font-content italic text-gray-700"><%= work.title %></div>
          <%= if Enum.empty?(work.authors) do %>
            <div class="font-content text-gray-700">
              <span class="uppercase font-detail text-xs text-gray-500">by</span>
              <%= "#{Enum.map_join(work.studios, ", ", & &1.display_name)}" %>
            </div>
          <% else %>
            <div class="font-content text-gray-700">
              <span class="uppercase font-detail text-xs text-gray-500">by</span>
              <%= "#{Enum.map_join(work.authors, ", ", & &1.display_name)}" %>
            </div>
          <% end %>
        </div>
      <% end %>
    <% end %>
    """
  end

  attr :film, Film, required: true

  def aliases(assigns) do
    ~H"""
    <%= if not Enum.empty?(@film.aliases) do %>
      <div>
        <div class="uppercase font-detail text-center text-xs text-gray-500">
          also known as
        </div>
        <%= for alias <- @film.aliases do %>
          <div>
            <div class="text-center font-content italic text-gray-700"><%= alias.title %></div>
            <div class="text-center font-detail text-xs text-gray-500">
              <%= alias.context %>
            </div>
          </div>
        <% end %>
      </div>
    <% end %>
    """
  end

  attr :film, Film
  attr :direction, :atom, values: [:next, :prev], required: true

  def series_film_info(assigns) do
    ~H"""
    <%= if @film do %>
      <div class="flex gap-2 justify-between items-center max-w-96">
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

  attr :film, Film, required: true
  attr :previous_series_film, Film
  attr :next_series_film, Film

  def series_info(assigns) do
    ~H"""
    <%= if @film.series_entry do %>
      <div>
        <div class="uppercase font-detail text-center text-xs text-gray-500">
          <%= "#{@film.series_entry.film_series.name} no. #{@film.series_entry.entry_number}" %>
        </div>
        <div class="w-fit m-auto text-red-700">
          <.series_film_info film={@previous_series_film} direction={:prev} />
          <.series_film_info film={@next_series_film} direction={:next} />
        </div>
        <.series_modal film={@film} />
      </div>
    <% end %>
    """
  end

  attr :film, Film, required: true

  def series_modal(assigns) do
    ~H"""
    <%= if @film.series_entry do %>
      <div class="w-fit m-auto font-content text-red-700 hover:cursor-pointer pt-2">
        <a phx-click={show_modal("series-modal")}>
          View Series <.icon name="hero-square-2-stack" class="h-6 w-6" />
        </a>
      </div>
      <.modal id="series-modal">
        <div class="max-h-[80vh] overflow-y-auto">
          <div class="font-display uppercase text-center pb-2 text-gray-700">
            <%= @film.series_entry.film_series.name %>
            <br /><span class="text-xs text-gray-500 font-extrabold">Series</span>
          </div>
          <div class="text-gray-700 font-content text-sm">
            <ol class="list-decimal list-outside gap-2">
              <%= for series_entry <- @film.series_entry.film_series.entries do %>
                <%= if series_entry.film.id != @film.id do %>
                  <li class="ml-8 my-1 text-red-700">
                    <.link href={~p"/films/#{series_entry.film.slug}"} class="hover:cursor-pointer">
                      <i>
                        <%= series_entry.film.title %>
                      </i>
                      (<%= series_entry.film.release_date.year %>)
                    </.link>
                  </li>
                <% else %>
                  <li class="ml-8 my-2">
                    <i><%= series_entry.film.title %></i> (<%= series_entry.film.release_date.year %>)
                  </li>
                <% end %>
              <% end %>
            </ol>
          </div>
        </div>
      </.modal>
    <% end %>
    """
  end

  attr :film, Film, required: true
  attr :previous_series_film, Film
  attr :next_series_film, Film

  def overview(assigns) do
    ~H"""
    <.named_divider name="Overview" />
    <div class="lg:grid lg:grid-cols-2 lg:gap-4 lg:items-center lg:justify-center lg:max-w-2xl m-auto">
      <div class="pb-4 lg:shrink-0">
        <.primary_poster film={@film} />
      </div>
      <div class="space-y-4">
        <.specs film={@film} />
        <.original_title film={@film} />
        <.works film={@film} />
        <.aliases film={@film} />
        <.series_info
          film={@film}
          previous_series_film={@previous_series_film}
          next_series_film={@next_series_film}
        />
        <.studios_or_production_committee film={@film} />
      </div>
    </div>
    """
  end

  attr :film, Film, required: true

  def staff(assigns) do
    ~H"""
    <.named_divider name="Staff" />
    <div class="max-w-96 m-auto lg:columns-2 lg:gap-x-8 lg:w-fit">
      <%= for {role, staffs} <- display_staff(@film) do %>
        <div class="text-center lg:text-left lg:break-inside-avoid-column pb-1">
          <div class="">
            <span class="font-detail text-xs uppercase text-gray-500"><%= role %></span>
          </div>
          <div class="">
            <span class="text-gray-700 font-content">
              <%= raw(Enum.map_join(staffs, "<br/>", &staff_display_name(&1))) %>
            </span>
          </div>
        </div>
      <% end %>
    </div>
    <.full_credits_modal film={@film} />
    """
  end

  attr :primary_role, Role, required: true
  attr :secondary_roles, :list, default: []

  def role(assigns) do
    ~H"""
    <div>
      <div id={"role-overview-#{@primary_role.id}"}>
        <div class="grid grid-cols-[150px_auto] gap-2">
          <div class="grid justify-items-end">
            <img
              class="h-[150px] w-[150px] max-w-[150px] rounded-lg drop-shadow-lg"
              src={@primary_role.avatar_url}
            />
          </div>
          <div class="flex flex-col justify-center">
            <div class="font-content text-sm text-gray-500"><%= role_title(@primary_role) %></div>
            <div class="font-content text-gray-500">
              <%= raw(process_role_name(@primary_role.name || @primary_role.description)) %>
              <%= if @primary_role.character_qualifiers do %>
                <span class="text-sm">(<%= @primary_role.character_qualifiers %>)</span>
              <% end %>
            </div>
            <div class="font-content text-lg text-gray-700">
              <%= role_display_name(@primary_role) %>
            </div>
            <div class="font-detail text-xs text-gray-500 uppercase">
              <%= @primary_role.role_qualifiers %>
            </div>
            <%= if role_is_uncredited?(@primary_role) do %>
              <div class="font-detail text-xs text-red-700/75 uppercase">Uncredited</div>
            <% end %>
            <%= for role <- @secondary_roles do %>
              <div class="font-content text-gray-700 text-lg">
                <%= role_display_name(role) %>
              </div>
              <div class="font-detail text-xs text-gray-500 uppercase">
                <%= role.role_qualifiers %>
              </div>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  attr :roles, :list, default: []
  attr :label, :string, required: true

  def cast_group(assigns) do
    ~H"""
    <%= unless Enum.empty?(@roles) do %>
      <.named_divider name={@label} />
      <div class="w-96 lg:w-full m-auto space-y-3 lg:space-y-0 lg:grid lg:grid-cols-3 lg:gap-4">
        <%= for [primary_role | rest] <- display_roles(@roles) do %>
          <.role primary_role={primary_role} secondary_roles={rest} />
        <% end %>
      </div>
    <% end %>
    """
  end

  attr :roles, :list, default: []

  def kaiju_cast_group(assigns) do
    ~H"""
    <%= unless Enum.empty?(@roles) do %>
      <.named_divider name="Kaiju, etc." />
      <div class="w-96 m-auto space-y-3 lg:w-full lg:space-y-0 lg:grid lg:grid-cols-3 lg:gap-4">
        <%= for {kaiju_name, [first | _rest] = kaiju_roles} <- display_kaiju_roles(@roles) do %>
          <div class="flex gap-2 items-center">
            <div>
              <img
                class="w-[150px] h-[150px] max-w-[150px] rounded-lg drop-shadow-lg"
                src={first.avatar_url}
              />
            </div>
            <div class="flex flex-col justify-center">
              <div class="font-content text-gray-500"><%= kaiju_name %></div>
              <%= for kr <- kaiju_roles do %>
                <div class="font-content text-lg text-gray-700">
                  <%= role_display_name(kr) %>
                </div>
                <%= if kr.qualifiers do %>
                  <div class="font-detail text-xs text-gray-500 uppercase">
                    <%= Enum.join(kr.qualifiers, ", ") %>
                  </div>
                <% end %>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>
    <% end %>
    """
  end

  attr :name, :string, required: true

  def named_divider(assigns) do
    ~H"""
    <div class="inline-flex items-center justify-center text-center w-full">
      <hr class="w-96 h-px my-8 border-0 rounded bg-red-700" />
      <span class="absolute px-3 font-detail text-sm uppercase text-red-700 -translate-x-1/2 bg-white left-1/2">
        <%= @name %>
      </span>
    </div>
    """
  end

  attr :film, Film, required: true

  def full_credits_modal(assigns) do
    ~H"""
    <%= if @film.credits do %>
      <div class="w-fit m-auto font-content text-red-700 hover:cursor-pointer pt-2">
        <a phx-click={show_modal("credits-modal")}>
          Full Cast & Crew <.icon name="hero-square-2-stack" class="h-6 w-6" />
        </a>
      </div>
      <.modal id="credits-modal">
        <div class="max-h-[80vh] overflow-y-auto">
          <div class="font-display uppercase text-center pb-2 text-gray-700">
            <%= @film.title %>
            <br /><span class="text-xs text-gray-500 font-extrabold">Full Cast & Crew</span>
          </div>
          <div class="grid grid-cols-2 gap-2 text-gray-700 font-content text-sm">
            <%= for [jpn_role, jpn_name, eng_role, eng_name] <- CSV.parse_string(@film.credits.credits, skip_headers: false) do %>
              <div>
                <span class="text-gray-500 font-mono text-xs"><%= jpn_role %></span> <br />
                <span><%= eng_role %></span>
              </div>
              <div>
                <span class="text-gray-500 font-mono text-xs"><%= jpn_name %></span> <br />
                <span><%= eng_name %></span>
              </div>
            <% end %>
          </div>
        </div>
      </.modal>
    <% end %>
    """
  end

  defp display_kaiju_roles(kaiju_roles) when is_list(kaiju_roles) do
    kaiju_roles
    |> Enum.reduce([], fn kr, acc ->
      current_role = kr.name || kr.kaiju_character.display_name

      case acc do
        [{^current_role, krs} | rest] -> [{current_role, krs ++ [kr]} | rest]
        _ -> [{current_role, [kr]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  defp display_roles(roles) do
    roles
    |> Enum.reduce([], fn role, acc ->
      if role.mergeable do
        [previous_role | rest] = acc
        [previous_role ++ [role] | rest]
      else
        [[role] | acc]
      end
    end)
    |> Enum.reverse()
  end

  defp display_staff(%Film{staff: staff}) do
    staff
    |> Enum.reduce([], fn s, acc ->
      current_role = s.role

      case acc do
        [{^current_role, ss} | rest] -> [{current_role, ss ++ [s]} | rest]
        _ -> [{current_role, [s]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  defp process_title(title) do
    title
    |> String.replace("20th", "20<span class=\"align-top text-lg\">th</span>")
    |> String.replace("3rd", "3<span class=\"align-top text-lg\">rd</span>")
  end

  defp process_role_name(role_name) do
    role_name
    |> String.replace("-maru", "<span class=\"italic\">-maru</span>")
    |> String.replace("-seijin", "<span class=\"italic\">-seijin</span>")
    |> String.replace("Gôtengô", "<span class=\"italic\">Gôtengô</span>")
    |> String.replace("Eclair", "<span class=\"italic\">Eclair</span>")
    |> String.replace("Karyû", "<span class=\"italic\">Karyû</span>")
  end

  defp role_display_name(%Role{person: %Person{display_name: display_name}}),
    do: display_name

  defp role_display_name(%Role{group: %Group{display_name: display_name}}), do: display_name

  defp role_display_name(%KaijuRole{person: %Person{display_name: display_name}}),
    do: display_name

  defp role_display_name(%KaijuRole{}), do: ""

  defp role_is_uncredited?(%Role{uncredited: true}), do: true
  defp role_is_uncredited?(_), do: false

  defp role_title(%Role{title: title}), do: title
  defp role_title(_), do: nil

  defp staff_display_name(%Staff{
         person: %Person{display_name: display_name}
       }),
       do: display_name

  defp staff_display_name(%Staff{
         group: %Group{display_name: display_name}
       }),
       do: display_name
end
