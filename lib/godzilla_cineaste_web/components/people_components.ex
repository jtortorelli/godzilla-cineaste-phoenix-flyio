defmodule GodzillaCineasteWeb.PeopleComponents do
  use GodzillaCineasteWeb, :html

  alias GodzillaCineaste.Role

  attr :birth_name, :string
  attr :japanese_birth_name, :string
  attr :birth_date, :string, required: true
  attr :birth_place, :string

  def birth_card(assigns) do
    ~H"""
    <div class="shadow-lg rounded-lg p-4 bg-yellow-200 w-64">
      <div class="flex items-end gap-2 mb-2">
        <div><.icon name="hero-cake-solid text-gray-500 h-4 w-4" /></div>
        <div class="font-display uppercase font-extrabold text-gray-500 text-sm">Born</div>
      </div>
      <%= if @birth_name do %>
        <div class="text-center font-content text-lg text-gray-700"><%= @birth_name %></div>
        <%= if @japanese_birth_name do %>
          <div class="text-center font-japanese text-xs text-gray-500">
            <%= @japanese_birth_name %>
          </div>
        <% end %>
      <% end %>
      <div class="text-center font-content text-lg text-gray-700"><%= @birth_date %></div>
      <%= if @birth_place do %>
        <div class="text-center font-detail uppercase text-gray-500 text-xs"><%= @birth_place %></div>
      <% end %>
    </div>
    """
  end

  attr :death_date, :string, required: true
  attr :death_place, :string
  attr :age, :string

  def death_card(assigns) do
    ~H"""
    <div class="shadow-lg rounded-lg p-4 bg-black w-64">
      <div class="flex items-end gap-2 mb-2">
        <div><.icon name="hero-moon-solid text-white h-4 w-4" /></div>
        <div class="font-display uppercase font-extrabold text-white text-sm">Died</div>
      </div>
      <div class="text-center font-content text-lg text-white"><%= @death_date %></div>
      <%= if @age do %>
        <div class="text-center font-content text-white">Aged <%= @age %></div>
      <% end %>
      <%= if @death_place do %>
        <div class="text-center font-detail uppercase text-white text-xs"><%= @death_place %></div>
      <% end %>
    </div>
    """
  end

  attr :film_title, :string, required: true
  attr :film_release_date, :string, required: true
  attr :roles, :list, required: true
  attr :staff, :list, required: true
  attr :film_poster_url, :string, required: true

  def film_card(assigns) do
    ~H"""
    <div class="shadow-lg rounded-lg p-4 w-64">
      <div class="flex items-end gap-2 mb-2">
        <div><.icon name="hero-film-solid" class="w-6 h-6 text-red-700" /></div>
        <div class="font-display uppercase font-extrabold text-red-700 text-sm">Film</div>
      </div>
      <div><img src={@film_poster_url} class="rounded-l-lg h-44" /></div>
      <div class="p-4">
        <div class="text-center font-detail text-red-700 text-xs uppercase">
          <%= @film_release_date %>
        </div>
        <%= unless Enum.empty?(@staff) do %>
        <% end %>
        <%= unless Enum.empty?(@roles) do %>
          <div class="text-center font-content text-gray-700">Actor</div>
          <div class="text-center font-detail text-gray-500 text-xs uppercase">as</div>
          <%= for r <- @roles do %>
            <div class="text-center font-content text-gray-700">
              <%= raw(Role.role_display_name(r)) %>
              <%= if r.character_qualifiers do %>
                <span class="text-sm">(<%= r.character_qualifiers %>)</span>
              <% end %>
            </div>
            <%= if r.role_qualifiers do %>
              <div class="text-center text-xs font-detail text-gray-500 uppercase">
                <%= r.role_qualifiers %>
              </div>
            <% end %>
            <%= if r.uncredited do %>
              <div class="text-center text-xs font-detail text-red-700 uppercase">Uncredited</div>
            <% end %>
          <% end %>
        <% end %>
      </div>
    </div>
    """
  end

  attr :card, :map, required: true

  def entity_card(assigns) do
    ~H"""
    <%= case @card.type do %>
      <% :birth -> %>
        <.birth_card
          birth_name={@card.birth_name}
          birth_date={@card.birth_date}
          birth_place={@card.birth_place}
          japanese_birth_name={@card.japanese_birth_name}
        />
      <% :death -> %>
        <.death_card death_date={@card.death_date} death_place={@card.death_place} age={@card.age} />
      <% :film -> %>
        <.film_card
          film_title={@card.film_title}
          film_release_date={@card.film_release_date}
          film_poster_url={@card.film_poster_url}
          roles={@card.roles}
          staff={@card.staff}
        />
      <% _ -> %>
    <% end %>
    """
  end
end
