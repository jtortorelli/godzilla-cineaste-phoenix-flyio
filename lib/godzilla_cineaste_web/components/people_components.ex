defmodule GodzillaCineasteWeb.PeopleComponents do
  use GodzillaCineasteWeb, :html

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

  attr :card, :map, required: true

  def entity_card(assigns) do
    case assigns[:card].type do
      :birth ->
        ~H"""
        <.birth_card
          birth_name={@card.birth_name}
          birth_date={@card.birth_date}
          birth_place={@card.birth_place}
          japanese_birth_name={@card.japanese_birth_name}
        />
        """

      :death ->
        ~H"""
        <.death_card death_date={@card.death_date} death_place={@card.death_place} age={@card.age} />
        """

      _ ->
        nil
    end
  end
end
