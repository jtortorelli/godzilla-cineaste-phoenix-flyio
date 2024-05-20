defmodule GodzillaCineasteWeb.PeopleComponents do
  use GodzillaCineasteWeb, :html

  alias GodzillaCineaste.Role

  attr :birth_name, :string
  attr :japanese_birth_name, :string
  attr :birth_date, :string, required: true
  attr :birth_place, :string

  def birth_card(assigns) do
    ~H"""
    <div class="p-4 w-64">
      <%= if @birth_name do %>
        <div class="font-content text-lg text-gray-700"><%= @birth_name %></div>
        <%= if @japanese_birth_name do %>
          <div class="font-japanese text-xs text-gray-500">
            <%= @japanese_birth_name %>
          </div>
        <% end %>
      <% end %>
      <div class="font-content text-lg text-gray-700"><%= @birth_date %></div>
      <%= if @birth_place do %>
        <div class="font-detail uppercase text-gray-500 text-xs"><%= @birth_place %></div>
      <% end %>
    </div>
    """
  end

  attr :death_date, :string, required: true
  attr :death_place, :string
  attr :age, :string

  def death_card(assigns) do
    ~H"""
    <div class="p-4 w-64">
      <div class="font-content text-lg"><%= @death_date %></div>
      <%= if @age do %>
        <div class="font-content">Aged <%= @age %></div>
      <% end %>
      <%= if @death_place do %>
        <div class="font-detail uppercase text-xs"><%= @death_place %></div>
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
    <div class="p-4 w-64">
      <div class="font-content text-lg italic"><%= @film_title %></div>
      <div class="font-detail text-red-700 text-xs uppercase">
        <%= @film_release_date %>
      </div>
      <div>
        <img src={@film_poster_url} class="rounded-lg h-44" />
      </div>
      <%= unless Enum.empty?(@staff) do %>
      <% end %>
      <%= unless Enum.empty?(@roles) do %>
        <div class="font-detail text-gray-500 text-xs uppercase">as</div>
        <%= for r <- @roles do %>
          <div class="font-content text-gray-700">
            <%= raw(Role.role_display_name(r)) %>
            <%= if r.character_qualifiers do %>
              <span class="text-sm">(<%= r.character_qualifiers %>)</span>
            <% end %>
          </div>
          <%= if r.role_qualifiers do %>
            <div class="text-xs font-detail text-gray-500 uppercase">
              <%= r.role_qualifiers %>
            </div>
          <% end %>
          <%= if r.uncredited do %>
            <div class="text-xs font-detail text-red-700 uppercase">Uncredited</div>
          <% end %>
        <% end %>
      <% end %>
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

  attr :card_type, :atom, required: true

  def timeline_node(assigns) do
    ~H"""
    <li class="relative mb-6 sm:mb-0">
      <div class="flex items-center">
        <.timeline_node_icon card_type={@card_type} />
        <div class="hidden sm:flex w-full bg-gray-200 h-0.5"></div>
      </div>
      <div class="mt-3 mb-3 sm:pe-8">
        <%= render_slot(@inner_block) %>
      </div>
    </li>
    """
  end

  def timeline(assigns) do
    ~H"""
    <div class="mt-8">
      <ol class="items-start sm:flex sm:flex-wrap">
        <%= render_slot(@inner_block) %>
      </ol>
    </div>
    """
  end

  attr :card_type, :atom, required: true

  def timeline_node_icon(assigns) do
    ~H"""
    <%= case @card_type  do %>
      <% :birth -> %>
        <div class="drop-shadow-lg z-10 flex items-center gap-2 text-gray-500 justify-center rounded-full ring-8 ring-yellow-200 bg-yellow-200 shrink-0">
          <.icon name="hero-sun" />
          <div class="font-display font-extrabold uppercase text-xs">Born</div>
        </div>
      <% :death -> %>
        <div class="drop-shadow-lg z-10 flex items-center gap-2 text-white justify-center rounded-full ring-8 ring-black bg-black shrink-0">
          <.icon name="hero-moon-solid" />
          <div class="font-display text-white font-extrabold uppercase text-xs">Died</div>
        </div>
      <% :film -> %>
        <div class="drop-shadow-lg z-10 flex items-center gap-2 text-white justify-center rounded-full ring-8 ring-red-700 bg-red-700 shrink-0">
          <.icon name="hero-film" />
          <div class="font-display font-extrabold uppercase text-xs">Film</div>
        </div>
      <% _ -> %>
    <% end %>
    """
  end
end
