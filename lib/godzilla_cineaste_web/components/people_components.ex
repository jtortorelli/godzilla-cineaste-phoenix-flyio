defmodule GodzillaCineasteWeb.PeopleComponents do
  use GodzillaCineasteWeb, :html

  attr :birth_name, PersonAlternateName
  attr :birth_date, :string, required: true
  attr :birth_place, :string

  def birth_card(assigns) do
    ~H"""
    <div>
      <div>Born</div>
      <%= if @birth_name do %>
        <div><%= @birth_name %></div>
      <% end %>
      <div><%= @birth_date %></div>
      <%= if @birth_place do %>
        <div><%= @birth_place %></div>
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
        />
        """

      _ ->
        nil
    end
  end
end
