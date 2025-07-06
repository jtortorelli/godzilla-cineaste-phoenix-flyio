defmodule GodzillaCineasteWeb.CommonComponents do
  use GodzillaCineasteWeb, :html

  def display_date(date_string) when is_binary(date_string) do
    date_string |> Date.from_iso8601!() |> Calendar.strftime("%-d %b %Y")
  end

  def nil_safe_iterator(key) do
    case key do
      nil -> []
      [] -> []
      [_ | _] -> key
    end
  end

  def person_showcase_link(assigns) do
    ~H"""
    <%= if @slug do %>
      <.cineaste_link href={~p"/v2/people/#{@slug}"}>
        {render_slot(@inner_block)}
      </.cineaste_link>
    <% else %>
      {render_slot(@inner_block)}
    <% end %>
    """
  end

  def film_showcase_link(assigns) do
    ~H"""
    <%= if @slug do %>
      <.cineaste_link href={~p"/v2/films/#{@slug}"}>
        {render_slot(@inner_block)}
      </.cineaste_link>
    <% else %>
      {render_slot(@inner_block)}
    <% end %>
    """
  end

  def cineaste_link(assigns) do
    ~H"""
    <.link
      class="underline decoration-gray-300 decoration-1 underline-offset-2 hover:cursor-pointer hover:text-red-700 hover:decoration-red-700"
      href={@href}
    >
      {render_slot(@inner_block)}
    </.link>
    """
  end
end
