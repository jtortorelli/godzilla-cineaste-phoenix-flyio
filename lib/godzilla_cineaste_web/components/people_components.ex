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
          <div class="text-center font-japanese text-sm text-gray-500"><%= @japanese_birth_name %></div>
        <% end %>
      <% end %>
      <div class="text-center font-content text-lg text-gray-700"><%= @birth_date %></div>
      <%= if @birth_place do %>
        <div class="text-center font-detail text-gray-500 text-sm"><%= @birth_place %></div>
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

      _ ->
        nil
    end
  end
end
