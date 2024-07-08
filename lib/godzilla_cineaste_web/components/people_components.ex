defmodule GodzillaCineasteWeb.PeopleComponents do
  use GodzillaCineasteWeb, :html

  alias GodzillaCineaste.{Film, KaijuRole, PartialDate, Person, PersonAlternateName, Place, Role}

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

  def person_overview(assigns) do
    ~H"""
    <.named_divider name="Overview" />
    <div class="lg:grid lg:grid-cols-2 lg:gap-4 lg:items-center lg:justify-center lg:max-w-2xl m-auto">
      <div class="text-center w-fit m-auto">
        <img class="rounded-lg drop-shadow-lg" src={@person.avatar_url} />
      </div>
      <div class="text-center w-fit m-auto flex flex-col gap-2">
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
      </div>
    </div>
    """
  end

  attr :selected_filmography, :list, required: true

  def person_filmography(assigns) do
    ~H"""
    <.named_divider name="Selected Filmography" />
    <div class="flex flex-col sm:flex-row sm:flex-wrap justify-center gap-4">
      <%= for f <- @selected_filmography do %>
        <div class="flex flex-row sm:flex-col sm:w-36 items-center gap-3">
          <div class="shrink-0">
            <img
              class="rounded-lg drop-shadow-lg"
              height={150}
              width={101}
              src={Film.primary_poster_url(f)}
            />
          </div>
          <div class="sm:text-center">
            <div class="font-content italic text-sm text-gray-700"><%= f.title %></div>
            <div class="font-detail text-xs text-red-700"><%= f.release_date.year %></div>
            <%= unless Enum.empty?(f.staff) and Enum.empty?(f.works) do %>
              <div class="font-content text-sm text-gray-700">
                <%= staff(f) %>
              </div>
            <% end %>
            <%= unless Enum.empty?(f.kaiju_roles) and Enum.empty?(f.roles) do %>
              <div class="font-detail text-xs text-red-700 uppercase">
                appearing
                <%= if Enum.any?(f.kaiju_roles ++ f.roles, & &1.uncredited) do %>
                  uncredited
                <% end %>
                as
              </div>
              <div class="font-content text-sm text-gray-700">
                <%= Enum.map_join(f.kaiju_roles ++ f.roles, ", ", &role_display_name(&1)) %>
              </div>
            <% end %>
          </div>
        </div>
      <% end %>
    </div>
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

  defp role_display_name(%Role{qualifiers: []} = role), do: Role.role_display_name(role)

  defp role_display_name(%Role{qualifiers: qualifiers} = role),
    do: "#{Role.role_display_name(role)} (#{Enum.join(qualifiers, ", ")})"

  defp role_display_name(%KaijuRole{name: name, qualifiers: []}), do: name

  defp role_display_name(%KaijuRole{name: name, qualifiers: qualifiers}),
    do: "#{name} (#{Enum.join(qualifiers, ",")})"

  defp staff(%Film{staff: staff, works: works}) do
    case {staff, works} do
      {[], []} -> []
      {staff, []} -> Enum.map_join(staff, ", ", & &1.role)
      {[], works} -> ["Original Work"]
      _ -> ["Original Work" | Enum.map(staff, & &1.role)] |> Enum.join(", ")
    end
  end
end
