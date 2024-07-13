defmodule GodzillaCineasteWeb.FilmComponents do
  @moduledoc false
  use GodzillaCineasteWeb, :html

  alias NimbleCSV.RFC4180, as: CSV

  alias GodzillaCineaste.{Film, Group, KaijuRole, Person, Role, Staff}

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
  attr :height, :integer, default: 400
  attr :width, :integer, default: 270

  def primary_poster(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <img
        class="rounded-lg drop-shadow-lg"
        height={@height}
        width={@width}
        src={Film.primary_poster_url(@film)}
      />
    </div>
    """
  end

  attr :film, Film, required: true

  def specs(assigns) do
    ~H"""
    <div class="text-gray-700 font-content flex justify-center space-x-8">
      <div><%= "#{@film.runtime}m" %></div>
      <div><%= Film.display_release_date(@film) %></div>
    </div>
    """
  end

  attr :film, Film, required: true

  def studios_or_production_committee(assigns) do
    ~H"""
    <div>
      <div class="text-center font-detail uppercase text-xs text-gray-500">A Production Of</div>
      <%= if @film.production_committee do %>
        <div class="font-content text-red-700 hover:cursor-pointer text-center">
          <a phx-click={show_modal("film-production-committee-modal")}>
            <%= @film.production_committee.display_name %>
            <.icon name="hero-square-2-stack" class="h-6 w-6" />
          </a>
        </div>
      <% else %>
        <div class="font-content text-center text-gray-700">
          <%= Enum.map_join(@film.studios, ", ", &(&1.better_display_name || &1.display_name)) %>
        </div>
      <% end %>
    </div>
    <%= if @film.production_committee do %>
      <.modal id="film-production-committee-modal">
        <div class="max-h-[80vh] overflow-y-auto">
          <div class="font-display uppercase text-center pb-2 text-gray-700">
            <%= @film.title %><br />
            <span class="text-xs text-gray-500 font-extrabold">
              Production Committee
            </span>
          </div>
          <div class="grid grid-cols-2 gap-2 text-gray-700 font-content text-sm">
            <%= for studio <- @film.production_committee.studios do %>
              <div><%= studio.better_display_name || studio.display_name %></div>
            <% end %>
          </div>
        </div>
      </.modal>
    <% end %>
    """
  end

  attr :film, Film, required: true

  def original_title(assigns) do
    ~H"""
    <div class="text-center">
      <div class="font-detail text-xs text-gray-500 uppercase">Original Title</div>
      <div class="space-y-1">
        <div class="font-japanese tracking-wide text-gray-700">
          <%= raw(@film.original_title.original) %>
        </div>
        <div class="font-content italic text-xs text-gray-500">
          <%= @film.original_title.transliteration %>
        </div>
        <%= if @film.original_title.transliteration != @film.original_title.translation do %>
          <div class="font-content italic text-xs text-gray-500">
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

  def blurb(assigns) do
    ~H"""
    <%= if @film.pitch do %>
      <div class="pb-4 m-auto text-center font-content text-gray-700 flex flex-col items-center">
        <div class="w-96 text-sm"><%= @film.pitch %></div>
      </div>
    <% end %>
    """
  end

  attr :film, Film, required: true
  attr :previous_series_film, Film
  attr :next_series_film, Film

  def overview(assigns) do
    ~H"""
    <.named_divider name="Overview" />
    <.blurb film={@film} />
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
    <div class="max-w-96 m-auto lg:columns-3 lg:gap-x-8 lg:w-fit">
      <%= for {role, staffs} <- display_staff(@film) do %>
        <div class="text-center lg:text-left lg:break-inside-avoid-column pb-1">
          <div class="">
            <span class="font-detail text-xs uppercase text-gray-500"><%= role %></span>
          </div>
          <div class="">
            <span class="text-gray-700 font-content">
              <%= for staff <- staffs do %>
                <.showcase_link entity={get_entity(staff)}>
                  <%= raw(
                    if has_disambig_chars?(staff) do
                      staff_display_name(staff) <>
                        ~s| <span class="text-xs">(<span class="font-japanese">#{staff.person.disambig_chars}</span>)</span>|
                    else
                      staff_display_name(staff)
                    end
                  ) %>
                </.showcase_link>
                <br />
              <% end %>
            </span>
          </div>
        </div>
      <% end %>
    </div>
    <.full_credits_modal film={@film} />
    """
  end

  attr :entity, :map
  slot :inner_block, required: true

  def showcase_link(assigns) do
    ~H"""
    <%= if is_struct(@entity) and showcased?(@entity) do %>
      <.link
        href={get_link(@entity)}
        class="underline decoration-gray-300 decoration-1 underline-offset-2 hover:cursor-pointer hover:text-red-700 hover:decoration-red-700"
      >
        <%= render_slot(@inner_block) %>
      </.link>
    <% else %>
      <%= render_slot(@inner_block) %>
    <% end %>
    """
  end

  attr :primary_role, Role, required: true
  attr :secondary_roles, :list, default: []

  def role(assigns) do
    ~H"""
    <div>
      <div id={"role-overview-#{@primary_role.id}"}>
        <div class="flex flex-row sm:flex-col sm:w-32 items-center gap-3">
          <div class="shrink-0">
            <img
              class="h-[75px] w-[75px] sm:h-[100px] sm:w-[100px] max-w-[150px] rounded-lg drop-shadow-lg"
              src={@primary_role.avatar_url}
            />
          </div>
          <div class="flex flex-col sm:items-center">
            <div class="font-detail sm:text-center text-gray-500  text-xs">
              <%= raw(Role.process_role_name(Role.role_display_name(@primary_role))) %>
              <%= if @primary_role.character_qualifiers do %>
                <br />
                <span class="text-xs">(<%= @primary_role.character_qualifiers %>)</span>
              <% end %>
            </div>
            <div class="font-content sm:text-center text-gray-700">
              <.showcase_link entity={get_entity(@primary_role)}>
                <%= role_display_name(@primary_role) %>
                <%= if has_disambig_chars?(@primary_role) do %>
                  <span class="text-xs">
                    (<span class="font-japanese"><%= @primary_role.person.disambig_chars %></span>)
                  </span>
                <% end %>
              </.showcase_link>
            </div>
            <div class="font-detail text-xs text-gray-500 uppercase">
              <%= @primary_role.role_qualifiers %>
            </div>
            <%= if role_is_uncredited?(@primary_role) do %>
              <div class="font-detail text-xs text-red-700/75 uppercase">Uncredited</div>
            <% end %>
            <%= for role <- @secondary_roles do %>
              <div class="font-content text-gray-700 text-lg">
                <.showcase_link entity={get_entity(role)}>
                  <%= role_display_name(role) %>
                </.showcase_link>
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

  def expand_cast_group(js \\ %JS{}, q) do
    js
    |> JS.hide(to: ".trunc-#{q}-cast")
    |> JS.hide(to: ".expand-#{q}-cast")
    |> JS.show(to: ".full-#{q}-cast")
    |> JS.show(to: ".collapse-#{q}-cast")
  end

  def collapse_cast_group(js \\ %JS{}, q) do
    js
    |> JS.hide(to: ".full-#{q}-cast")
    |> JS.hide(to: ".collapse-#{q}-cast")
    |> JS.show(to: ".trunc-#{q}-cast")
    |> JS.show(to: ".expand-#{q}-cast")
  end

  attr :roles, :list, default: []
  attr :label, :string, required: true
  attr :q, :atom

  def cast_group(assigns) do
    ~H"""
    <%= unless Enum.empty?(@roles) do %>
      <.named_divider name={@label} />
      <div class={"trunc-#{@q}-cast"}>
        <div class="flex flex-col sm:flex-row sm:flex-wrap justify-center gap-4">
          <%= for [primary_role | rest] <- Enum.take(display_roles(@roles), 7) do %>
            <.role primary_role={primary_role} secondary_roles={rest} />
          <% end %>
        </div>
      </div>
      <div class={"full-#{@q}-cast hidden"}>
        <div class="flex flex-col sm:flex-row sm:flex-wrap justify-center gap-4">
          <%= for [primary_role | rest] <- display_roles(@roles) do %>
            <.role primary_role={primary_role} secondary_roles={rest} />
          <% end %>
        </div>
      </div>
      <%= if length(@roles) > 7 do %>
        <div class={"expand-#{@q}-cast text-center pt-6"}>
          <button
            class="bg-red-700 text-white text-sm uppercase font-detail rounded-lg w-full sm:w-auto h-12 drop-shadow-lg px-4"
            phx-click={expand_cast_group(@q)}
          >
            <%= "+#{length(@roles) - 7} more" %>
            <.icon name="hero-chevron-down-solid" />
          </button>
        </div>
        <div class={"hidden collapse-#{@q}-cast text-center pt-6"}>
          <button
            class="text-red-700 text-sm  uppercase font-detail rounded-lg w-full sm:w-auto h-12 shadow-lg px-4"
            phx-click={collapse_cast_group(@q)}
          >
            Show less <.icon name="hero-chevron-up-solid" />
          </button>
        </div>
      <% end %>
    <% end %>
    """
  end

  attr :roles, :list, default: []

  def kaiju_cast_group(assigns) do
    ~H"""
    <%= unless Enum.empty?(@roles) do %>
      <.named_divider name="Kaiju, etc." />
      <div class="trunc-kaiju-cast">
        <div class="flex flex-col sm:flex-row sm:flex-wrap justify-center gap-4">
          <%= for {kaiju_name, [first | _rest] = kaiju_roles} <- Enum.take(display_kaiju_roles(@roles), 7) do %>
            <div class="flex flex-row sm:flex-col sm:w-32 items-center gap-3">
              <div class="shrink-0">
                <img
                  class="h-[75px] w-[75px] sm:h-[100px] sm:w-[100px] max-w-[150px] rounded-lg drop-shadow-lg"
                  src={first.avatar_url}
                />
              </div>
              <div class="flex flex-col sm:items-center">
                <div class="font-detail text-gray-500 text-xs"><%= kaiju_name %></div>
                <%= for kr <- kaiju_roles do %>
                  <div class="font-content sm:text-center text-gray-700">
                    <.showcase_link entity={get_entity(kr)}>
                      <%= role_display_name(kr) %>
                    </.showcase_link>
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
      </div>
      <div class="full-kaiju-cast hidden">
        <div class="flex flex-col sm:flex-row sm:flex-wrap justify-center gap-4">
          <%= for {kaiju_name, [first | _rest] = kaiju_roles} <- display_kaiju_roles(@roles) do %>
            <div class="flex flex-row sm:flex-col sm:w-32 items-center gap-3">
              <div class="shrink-0">
                <img
                  class="h-[75px] w-[75px] sm:h-[100px] sm:w-[100px] max-w-[150px] rounded-lg drop-shadow-lg"
                  src={first.avatar_url}
                />
              </div>
              <div class="flex flex-col sm:items-center">
                <div class="font-detail text-gray-500 text-xs"><%= kaiju_name %></div>
                <%= for kr <- kaiju_roles do %>
                  <div class="font-content sm:text-center text-gray-700">
                    <.showcase_link entity={get_entity(kr)}>
                      <%= role_display_name(kr) %>
                    </.showcase_link>
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
      </div>
      <%= if length(@roles) > 7 do %>
        <div class="expand-kaiju-cast text-center pt-6">
          <button
            class="bg-red-700 text-white text-sm uppercase font-detail rounded-lg w-full sm:w-auto h-12 drop-shadow-lg px-4"
            phx-click={expand_cast_group(:kaiju)}
          >
            <%= "+#{length(@roles) - 7} more" %>
            <.icon name="hero-chevron-down-solid" />
          </button>
        </div>
        <div class="hidden collapse-kaiju-cast text-center pt-6">
          <button
            class="text-red-700 text-sm  uppercase font-detail rounded-lg w-full sm:w-auto h-12 shadow-lg px-4"
            phx-click={collapse_cast_group(:kaiju)}
          >
            Show less <.icon name="hero-chevron-up-solid" />
          </button>
        </div>
      <% end %>
    <% end %>
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

  defp role_display_name(%Role{person: %Person{display_name: display_name}}),
    do: display_name

  defp role_display_name(%Role{group: %Group{display_name: display_name}}), do: display_name

  defp role_display_name(%KaijuRole{person: %Person{display_name: display_name}}),
    do: display_name

  defp role_display_name(%KaijuRole{}), do: ""

  defp has_disambig_chars?(%{person: %Person{disambig_chars: disambig_chars}})
       when is_binary(disambig_chars),
       do: true

  defp has_disambig_chars?(_), do: false

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

  defp get_entity(%{person: %Person{} = person}), do: person
  defp get_entity(%{group: %Group{} = group}), do: group
  defp get_entity(_), do: nil

  defp showcased?(%Group{showcased: true}), do: true
  defp showcased?(%Person{showcased: true}), do: true
  defp showcased?(_), do: false

  defp get_link(%Group{slug: slug}), do: ~p"/people/#{slug}"
  defp get_link(%Person{slug: slug}), do: ~p"/people/#{slug}"
end
