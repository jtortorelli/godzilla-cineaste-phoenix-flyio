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
    Role,
    TVSeries
  }

  attr :display_name, :string, required: true
  attr :japanese_name, :string, required: true

  def page_heading(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <h1 class="font-display tracking-wider uppercase text-2xl text-gray-700 p-4">
        <%= @display_name %>
      </h1>
    </div>
    """
  end

  attr :person, Person, required: true

  def person_birth_date(assigns) do
    ~H"""
    <%= if Person.has_birth_date?(@person) do %>
      <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
        <div>
          <.icon name="tabler-sun-high" class="text-gray-500 h-5 w-4" />
        </div>
        <div class="space-y-1">
          <div class="font-content text-gray-700">
            <%= PartialDate.display_date(@person.dob) %>
            <%= if Person.status(@person) == :alive do %>
              (<%= Person.age(@person) %>)
            <% end %>
          </div>
          <.birth_name birth_name={Person.birth_name(@person)} />
          <%= if @person.birth_place do %>
            <div class="font-content text-gray-500 text-xs">
              <%= Place.display_place(@person.birth_place) %>
            </div>
          <% end %>
        </div>
      </div>
    <% end %>
    """
  end

  attr :person, Person, required: true

  def person_death_date(assigns) do
    ~H"""
    <%= if Person.has_death_date?(@person) do %>
      <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
        <div><.icon name="tabler-moon" class="text-gray-500 h-5 w-4" /></div>
        <div class="space-y-1">
          <div class="font-content text-gray-700">
            <%= PartialDate.display_date(@person.dod) %> (<%= Person.age(@person) %>)
          </div>
          <%= if @person.death_place do %>
            <div class="font-content text-gray-500 text-xs">
              <%= Place.display_place(@person.death_place) %>
            </div>
          <% end %>
          <%= if @person.cause_of_death do %>
            <div class="font-content text-gray-500 text-xs">
              <%= @person.cause_of_death %>
            </div>
          <% end %>
        </div>
      </div>
    <% end %>
    <%= if Person.unknown_death_date?(@person) do %>
      <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
        <div><.icon name="tabler-moon" class="text-gray-500 h-5 w-4" /></div>
        <div class="font-content text-gray-700">Unknown Date</div>
      </div>
    <% end %>
    """
  end

  attr :person, Person, required: true

  def person_overview(assigns) do
    ~H"""
    <.named_divider name="Overview" />
    <div class="flex flex-col justify-center lg:grid lg:grid-flow-col lg:auto-cols-auto lg:gap-4 lg:items-center lg:justify-center lg:max-w-2xl m-auto mb-1">
      <div class="pb-4 lg:shrink-0 h-full w-fit m-auto">
        <img class="rounded-lg drop-shadow-lg" src={@person.avatar_url} />
      </div>
      <div class="text-sm m-auto space-y-3 h-full">
        <.japanese_name japanese_name={@person.japanese_name} />
        <.person_birth_date person={@person} />
        <.person_death_date person={@person} />
        <.person_aliases person={@person} />
        <.person_spouses person={@person} />
        <.person_family person={@person} />
      </div>
    </div>
    <.person_trivia person={@person} />
    """
  end

  attr :person, Person, required: true

  def person_trivia(assigns) do
    ~H"""
    <%= if @person.trivia && !Enum.empty?(@person.trivia.trivia) do %>
      <%= for t <- @person.trivia.trivia do %>
        <div class="text-sm font-content text-gray-700 mb-1 w-96 mx-auto">
          <%= raw(t) %>
        </div>
      <% end %>
    <% end %>
    """
  end

  attr :japanese_name, :string

  def japanese_name(assigns) do
    ~H"""
    <%= if @japanese_name do %>
      <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
        <div><.icon name="tabler-language" class="text-gray-500 h-5 w-4" /></div>
        <div class="font-japanese text-gray-700"><%= @japanese_name %></div>
      </div>
    <% end %>
    """
  end

  attr :person, Person, required: true

  def person_aliases(assigns) do
    ~H"""
    <%= for a <- Person.aliases(@person) do %>
      <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
        <div><.icon name="tabler-at" class="text-gray-500 h-5 w-4" /></div>
        <div>
          <div class="font-content text-gray-700"><%= a.name %></div>
          <%= if a.japanese_name do %>
            <div class="font-content text-gray-500 text-xs"><%= a.japanese_name %></div>
          <% end %>
          <%= if a.context do %>
            <div class="font-content text-gray-500 text-xs"><%= a.context %></div>
          <% end %>
          <%= if a.category == :mistranslation do %>
            <div class="font-content text-gray-500 text-xs">Mistranslation</div>
          <% end %>
        </div>
      </div>
    <% end %>
    """
  end

  attr :person, Person, required: true

  def person_spouses(assigns) do
    ~H"""
    <%= for relationship <- spouses(@person) do %>
      <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
        <div><.icon name="tabler-chart-circles" class="text-gray-500 h-5 w-5" /></div>
        <div>
          <div class="font-content text-gray-500">
            <.person_showcase_link person={relationship.relative}>
              <%= relationship.relative.display_name %>
            </.person_showcase_link>
          </div>
        </div>
      </div>
    <% end %>
    """
  end

  attr :person, Person, required: true

  def person_family(assigns) do
    ~H"""
    <%= unless Enum.empty?(family(@person)) do %>
      <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
        <div><.icon name="tabler-users-group" class="text-gray-500 h-5 w-5" /></div>
        <div>
          <%= for relationship <- family(@person) do %>
            <div class="font-content text-gray-500">
              <.person_showcase_link person={relationship.relative}>
                <%= relationship.relative.display_name %>
              </.person_showcase_link>
            </div>
            <div class="font-content text-gray-500 text-xs capitalize">
              <%= relationship.relationship |> Atom.to_string() |> String.replace("_", "-") %>
            </div>
          <% end %>
        </div>
      </div>
    <% end %>
    """
  end

  attr :group, Group, required: true

  def group_active_period(assigns) do
    ~H"""
    <%= if PartialDate.display_date_range(@group.active_period_start, @group.active_period_end) do %>
      <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
        <div><.icon name="tabler-calendar-time" class="text-gray-500 h-5 w-4" /></div>
        <div class="font-content text-gray-700">
          <%= PartialDate.display_date_range(@group.active_period_start, @group.active_period_end) %>
        </div>
      </div>
    <% end %>
    """
  end

  attr :group, Group, required: true

  def group_overview(assigns) do
    ~H"""
    <.named_divider name="Overview" />
    <div class="flex flex-col lg:grid lg:grid-flow-col lg:auto-cols-auto lg:gap-4 lg:items-center lg:justify-center lg:max-w-2xl m-auto">
      <div class="pb-4 lg:shrink-0 h-full w-fit m-auto">
        <img class="rounded-lg drop-shadow-lg mb-2" src={@group.avatar_url} />
      </div>
      <div class="text-sm m-auto space-y-3 h-full">
        <.japanese_name japanese_name={@group.japanese_name} />
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
      <div class="w-96 m-auto sm:w-fit flex flex-col sm:flex-row flex-wrap gap-6 justify-center">
        <%= for member <- @group.members do %>
          <div class="flex flex-col text-sm gap-3">
            <div class="sm:text-center text-base font-content text-gray-700">
              <%= member.display_name %>
            </div>
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

  attr :qualifier, :string, required: true

  def qualifier_icon(assigns) do
    ~H"""
    <%= case @qualifier do %>
      <% "CGI" -> %>
        <.icon name="tabler-server" class="h-3 w-3" />
      <% "Motion Capture" -> %>
        <.icon name="tabler-stretching-2" class="h-3 w-3" />
      <% "American Version" -> %>
        <.icon name="tabler-world" class="h-3 w-3" />
      <% "Photo" -> %>
        <.icon name="tabler-photo" class="h-3 w-3" />
      <% "Puppet" -> %>
        <.icon name="tabler-mood-happy" class="h-3 w-3" />
      <% "Stock Footage" -> %>
        <.icon name="tabler-recycle" class="h-3 w-3" />
      <% "Suit Actor" -> %>
        <.icon name="tabler-meeple" class="h-3 w-3" />
      <% "Voice" -> %>
        <.icon name="tabler-microphone-2" class="h-3 w-3" />
    <% end %>
    """
  end

  attr :entry, :any, required: true

  def person_filmography_entry(assigns) do
    ~H"""
    <%= case @entry do %>
      <% %Film{} -> %>
        <.person_filmography_film_entry film={@entry} />
      <% %TVSeries{} -> %>
        <.person_filmography_tv_series_entry tv_series={@entry} />
    <% end %>
    """
  end

  attr :film, Film, required: true

  def person_filmography_film_entry(assigns) do
    ~H"""
    <div class="flex flex-row w-60 items-start gap-3">
      <div class="shrink-0">
        <img
          class="rounded-lg drop-shadow-lg min-h-[150px]"
          height={150}
          width={101}
          src={Film.primary_poster_url(@film)}
        />
      </div>
      <div>
        <div class="font-content text-xs text-gray-500 flex items-baseline gap-1">
          <div>
            <.icon name="tabler-movie" class="h-5 w-4" />
          </div>
          <div>
            <%= @film.release_date.year %>
          </div>
        </div>
        <div class="font-content text-sm text-gray-700 mb-1">
          <.film_showcase_link film={@film}>
            <span class="italic"><%= @film.title %></span>
          </.film_showcase_link>
        </div>
        <%= unless Enum.empty?(@film.works) do %>
          <div class="font-content text-xs text-gray-500 flex">
            <div>
              <.icon name="tabler-chair-director" class="h-4 w-4" />
            </div>
            <div>
              Original Work
            </div>
          </div>
        <% end %>
        <%= for s <- @film.staff do %>
          <div class="font-content text-xs text-gray-500 flex">
            <div>
              <.icon name="tabler-chair-director" class="h-4 w-4" />
            </div>
            <div>
              <div>
                <%= s.role %>
              </div>
              <%= if s.staff_alias do %>
                <div>
                  <.icon name="tabler-at" class="h-3 w-3" /><%= s.staff_alias %>
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
        <%= for r <- @film.kaiju_roles ++ @film.roles do %>
          <div class="font-content text-xs text-gray-500 flex gap-1">
            <div>
              <.icon name="tabler-masks-theater" class="h-4 w-4" />
            </div>
            <div>
              <div>
                <%= raw(role_display_name(r)) %>
              </div>
              <%= if r.actor_alias do %>
                <.icon name="tabler-at" class="h-3 w-3" /><%= r.actor_alias %>
              <% end %>
              <%= for q <- r.qualifiers do %>
                <.qualifier_icon qualifier={q} />
              <% end %>
              <%= if r.uncredited do %>
                <.icon name="tabler-id-off" class="text-red-700 h-3 w-3" />
              <% end %>
            </div>
          </div>
        <% end %>
        <%= for nomination <- @film.award_nominations do %>
          <div class="font-content text-xs text-amber-600 flex gap-1">
            <div>
              <.icon
                name={if nomination.won, do: "tabler-trophy-filled", else: "tabler-trophy"}
                class="h-4 w-4"
              />
            </div>
            <div>
              <div>
                <%= get_ordinal(nomination.category.ceremony.ordinal) %> <%= nomination.category.ceremony.award.nickname %>s
              </div>
              <div><%= nomination.category.name %></div>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  attr :tv_series, TVSeries, required: true

  def person_filmography_tv_series_entry(assigns) do
    ~H"""
    <div class="flex flex-row w-60 items-start gap-3">
      <div class="shrink-0">
        <img class="rounded-lg drop-shadow-lg" width={101} src={@tv_series.title_card_url} />
      </div>
      <div>
        <div class="font-content text-xs text-gray-500 flex items-baseline gap-1">
          <div>
            <.icon name="tabler-device-tv-old" class="h-5 w-4" />
          </div>
          <div>
            <%= @tv_series.first_air_date.year %>
          </div>
        </div>
        <div class="font-content text-sm text-gray-700 mb-1">
          <span class="italic"><%= @tv_series.title %></span>
        </div>
        <%= for s <- @tv_series.main_staff do %>
          <div class="font-content text-xs text-gray-500 flex">
            <div>
              <.icon name="tabler-chair-director" class="h-4 w-4" />
            </div>
            <div>
              <div>
                <%= s.role %>
              </div>
            </div>
          </div>
        <% end %>
        <%= for r <- @tv_series.main_cast do %>
          <div class="font-content text-xs text-gray-500 flex gap-1">
            <div>
              <.icon name="tabler-masks-theater" class="h-4 w-4" />
            </div>
            <div>
              <div>
                <%= r.name %>
              </div>
              <div>
                <%= r.num_of_episodes %> <%= if r.num_of_episodes > 1, do: "Episodes", else: "Episode" %>
              </div>
            </div>
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
    <div class="full-filmography">
      <div class="flex flex-col sm:flex-row sm:flex-wrap gap-4 m-auto sm:w-fit w-96">
        <%= for entry <- @selected_filmography do %>
          <.person_filmography_entry entry={entry} />
        <% end %>
      </div>
    </div>
    """
  end

  attr :film, Film, required: true
  slot :inner_block, required: true

  def film_showcase_link(assigns) do
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

  attr :person, Person, required: true
  slot :inner_block, required: true

  def person_showcase_link(assigns) do
    ~H"""
    <%= if @person.showcased do %>
      <.link
        href={~p"/people/#{@person.slug}"}
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
      <div class="font-content text-gray-500 text-xs"><%= @birth_name.name %></div>
      <%= if @birth_name.japanese_name do %>
        <div class="font-japanese text-gray-500 text-xs"><%= @birth_name.japanese_name %></div>
      <% end %>
    <% end %>
    """
  end

  defp role_display_name(%Role{} = role), do: Role.role_display_name(role)

  defp role_display_name(%KaijuRole{name: name}), do: name

  defp spouses(%Person{} = person) do
    person.relationships |> Enum.filter(&(&1.relationship == :spouse)) |> Enum.sort_by(& &1.order)
  end

  defp family(%Person{} = person) do
    person.relationships |> Enum.filter(&(&1.relationship != :spouse)) |> Enum.sort_by(& &1.order)
  end

  defp get_ordinal(number) when number in [11, 12, 13], do: "#{number}th"

  defp get_ordinal(number) when number > 0 do
    last_digit = number |> Integer.digits() |> Enum.reverse() |> List.first()

    case last_digit do
      1 -> "#{number}st"
      2 -> "#{number}nd"
      3 -> "#{number}rd"
      _ -> "#{number}th"
    end
  end
end
