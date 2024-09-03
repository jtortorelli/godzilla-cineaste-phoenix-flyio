defmodule GodzillaCineasteWeb.PeopleComponents do
  use GodzillaCineasteWeb, :html

  alias GodzillaCineaste.{
    Film,
    Group,
    KaijuRole,
    PartialDate,
    Person,
    PersonAlternateName,
    Place,
    Role
  }

  attr :display_name, :string, required: true
  attr :japanese_name, :string, required: true

  def page_heading(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <h1 class="font-display tracking-wider uppercase text-2xl text-gray-700 p-4">
        <%= @display_name %>
        <br />
        <span class="font-japanese uppercase p-2 text-base text-gray-500 tracking-[.2em] font-bold">
          <%= @japanese_name %>
        </span>
      </h1>
    </div>
    """
  end

  attr :person, Person, required: true

  def person_birth_date(assigns) do
    ~H"""
    <%= if Person.has_birth_date?(@person) do %>
      <div>
        <div class="font-detail uppercase text-red-700 text-sm">born</div>
        <.birth_name birth_name={Person.birth_name(@person)} />
        <div class="font-content text-gray-700">
          <%= PartialDate.display_date(@person.dob) %>
          <%= if Person.status(@person) == :alive do %>
            (<%= Person.age(@person) %>)
          <% end %>
        </div>
        <%= if @person.birth_place do %>
          <div class="font-detail text-gray-500 uppercase text-xs">
            <%= Place.display_place(@person.birth_place) %>
          </div>
        <% end %>
      </div>
    <% end %>
    """
  end

  attr :person, Person, required: true

  def person_death_date(assigns) do
    ~H"""
    <%= if Person.has_death_date?(@person) do %>
      <div>
        <div class="font-detail uppercase text-red-700 text-sm">died</div>
        <div class="font-content text-gray-700">
          <%= PartialDate.display_date(@person.dod) %> (<%= Person.age(@person) %>)
        </div>
        <%= if @person.death_place do %>
          <div class="font-detail text-gray-500 uppercase text-xs">
            <%= Place.display_place(@person.death_place) %>
          </div>
        <% end %>
      </div>
    <% end %>
    <%= if Person.unknown_death_date?(@person) do %>
      <div>
        <div class="font-detail uppercase text-red-700 text-sm">died</div>
        <div class="font-content text-gray-700">Unknown Date</div>
      </div>
    <% end %>
    """
  end

  attr :person, Person, required: true

  def person_overview(assigns) do
    ~H"""
    <.named_divider name="Overview" />
    <div class="lg:grid lg:grid-cols-2 lg:gap-4 lg:items-center lg:justify-center lg:max-w-2xl m-auto">
      <div class="text-center w-fit m-auto">
        <img class="rounded-lg drop-shadow-lg" src={@person.avatar_url} />
      </div>
      <div class="text-center w-fit m-auto flex flex-col gap-2">
        <.person_birth_date person={@person} />
        <.person_death_date person={@person} />
      </div>
    </div>
    """
  end

  attr :group, Group, required: true

  def group_active_period(assigns) do
    ~H"""
    <%= if PartialDate.display_date_range(@group.active_period_start, @group.active_period_end) do %>
      <div class="font-detail uppercase text-xs text-red-700">active period</div>
      <div class="font-content text-gray-700">
        <%= PartialDate.display_date_range(@group.active_period_start, @group.active_period_end) %>
      </div>
    <% end %>
    """
  end

  attr :group, Group, required: true

  def group_overview(assigns) do
    ~H"""
    <.named_divider name="Overview" />
    <div class="lg:grid lg:grid-cols-2 lg:gap-4 lg:items-center lg:justify-center lg:max-w-2xl m-auto">
      <div class="text-center w-fit m-auto">
        <img class="rounded-lg drop-shadow-lg mb-2" src={@group.avatar_url} />
      </div>
      <div class="text-center">
        <.group_active_period group={@group} />
      </div>
    </div>
    """
  end

  attr :group, Group, required: true

  def group_members(assigns) do
    ~H"""
    <%= unless Enum.empty?(@group.members) do %>
      <.named_divider name="Members" />
      <div class="flex flex-col sm:flex-row flex-wrap gap-6 justify-center">
        <%= for member <- @group.members do %>
          <div class="text-center flex flex-col gap-3">
            <div class="font-content text-gray-700"><%= member.display_name %></div>
            <div>
              <.person_birth_date person={member} />
            </div>
            <div>
              <.person_death_date person={member} />
            </div>
          </div>
        <% end %>
      </div>
    <% end %>
    """
  end

  attr :film, Film, required: true

  def person_filmography_entry(assigns) do
    ~H"""
    <div class="flex flex-row sm:flex-col sm:w-36 items-center gap-3">
      <div class="shrink-0">
        <img
          class="rounded-lg drop-shadow-lg min-h-[150px]"
          height={150}
          width={101}
          src={Film.primary_poster_url(@film)}
        />
      </div>
      <div class="sm:text-center">
        <div class="font-content text-sm text-gray-700">
          <.showcase_link film={@film}>
            <span class="italic"><%= @film.title %></span> (<%= @film.release_date.year %>)
          </.showcase_link>
        </div>
        <%= unless Enum.empty?(@film.staff) and Enum.empty?(@film.works) do %>
          <div class="font-content text-sm text-gray-700">
            <%= staff(@film) %>
          </div>
        <% end %>
        <%= unless Enum.empty?(@film.kaiju_roles) and Enum.empty?(@film.roles) do %>
          <div class="font-detail text-xs text-red-700 uppercase">
            <%= if Enum.any?(@film.kaiju_roles ++ @film.roles, & &1.uncredited) do %>
              uncredited
            <% end %>
            as
          </div>
          <div class="font-content text-sm text-gray-700">
            <%= for r <- @film.kaiju_roles ++ @film.roles do %>
              <%= role_display_name(r) %><br />
              <%= for q <- r.qualifiers do %>
                <span class="text-xs font-detail uppercase text-gray-500"><%= q %></span> <br />
              <% end %>
            <% end %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  attr :selected_filmography, :list, required: true

  def person_filmography(assigns) do
    ~H"""
    <.named_divider name="Selected Filmography" />
    <div class="trunc-filmography">
      <div class="flex flex-col sm:flex-row sm:flex-wrap justify-center gap-4">
        <%= for f <- Enum.take(@selected_filmography, 6) do %>
          <.person_filmography_entry film={f} />
        <% end %>
      </div>
    </div>
    <div class="full-filmography hidden">
      <div class="flex flex-col sm:flex-row sm:flex-wrap justify-center gap-4">
        <%= for f <- @selected_filmography do %>
          <.person_filmography_entry film={f} />
        <% end %>
      </div>
    </div>
    <%= if length(@selected_filmography) > 6 do %>
      <div class="expand-filmography text-center pt-6">
        <button
          class="bg-red-700 text-white text-sm uppercase font-detail rounded-lg w-full sm:w-auto h-12 drop-shadow-lg px-4"
          phx-click={expand_filmography()}
        >
          <%= "+#{length(@selected_filmography) - 6} more" %>
          <.icon name="tabler-chevron-down" />
        </button>
      </div>
      <div class="hidden collapse-filmography text-center pt-6">
        <button
          class="text-red-700 text-sm  uppercase font-detail rounded-lg w-full sm:w-auto h-12 shadow-lg px-4"
          phx-click={collapse_filmography()}
        >
          Show less <.icon name="tabler-chevron-up" />
        </button>
      </div>
    <% end %>
    """
  end

  def expand_filmography(js \\ %JS{}) do
    js
    |> JS.hide(to: ".trunc-filmography")
    |> JS.hide(to: ".expand-filmography")
    |> JS.show(to: ".full-filmography")
    |> JS.show(to: ".collapse-filmography")
  end

  def collapse_filmography(js \\ %JS{}) do
    js
    |> JS.hide(to: ".full-filmography")
    |> JS.hide(to: ".collapse-filmography")
    |> JS.show(to: ".trunc-filmography")
    |> JS.show(to: ".expand-filmography")
  end

  attr :film, Film, required: true
  slot :inner_block, required: true

  def showcase_link(assigns) do
    ~H"""
    <%= if @film.showcased do %>
      <.link
        href={~p"/films/#{@film.slug}"}
        class="underline decoration-gray-300 decoration-1 underline-offset-2 hover:cursor-pointer hover:text-red-700 hover:decoration-red-700"
      >
        <%= render_slot(@inner_block) %>
      </.link>
    <% else %>
      <%= render_slot(@inner_block) %>
    <% end %>
    """
  end

  attr :birth_name, PersonAlternateName, required: true

  def birth_name(assigns) do
    ~H"""
    <%= if @birth_name.name do %>
      <div class="font-content text-gray-700"><%= @birth_name.name %></div>
      <%= if @birth_name.japanese_name do %>
        <div class="font-japanese text-gray-500 text-sm"><%= @birth_name.japanese_name %></div>
      <% end %>
    <% end %>
    """
  end

  defp role_display_name(%Role{} = role), do: Role.role_display_name(role)

  defp role_display_name(%KaijuRole{name: name}), do: name

  defp staff(%Film{staff: staff, works: works}) do
    case {staff, works} do
      {[], []} -> []
      {staff, []} -> Enum.map_join(staff, ", ", & &1.role)
      {[], _works} -> ["Original Work"]
      _ -> ["Original Work" | Enum.map(staff, & &1.role)] |> Enum.join(", ")
    end
  end
end
