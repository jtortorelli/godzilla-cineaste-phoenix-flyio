defmodule GodzillaCineasteWeb.CommonComponents do
  use GodzillaCineasteWeb, :html

  def display_date(date_string) when is_binary(date_string) do
    date_string |> Date.from_iso8601!() |> Calendar.strftime("%-d %b %Y")
  end

  def display_date(date_string, date_resolution) when is_binary(date_string) do
    date = Date.from_iso8601!(date_string)

    case date_resolution do
      "month" -> Calendar.strftime(date, "%b %Y")
      "year" -> Calendar.strftime(date, "%Y")
      _ -> Calendar.strftime(date, "%-d %b %Y")
    end
  end

  def process_role_name(role_name) do
    role_name
    |> String.replace("-maru", "<span class=\"italic\">-maru</span>")
    |> String.replace("-seijin", "<span class=\"italic\">-seijin</span>")
    |> String.replace("Gôtengô", "<span class=\"italic\">Gôtengô</span>")
    |> String.replace("Eclair", "<span class=\"italic\">Eclair</span>")
    |> String.replace("Karyû", "<span class=\"italic\">Karyû</span>")
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

  def qualifier_icon(assigns) do
    ~H"""
    <%= case String.downcase(@qualifier) do %>
      <% "cgi" -> %>
        <.icon name="tabler-server" class="h-4 w-4" />
      <% "motion capture" -> %>
        <.icon name="tabler-stretching-2" class="h-4 w-4" />
      <% "american version" -> %>
        <.icon name="tabler-world" class="h-4 w-4" />
      <% "photo" -> %>
        <.icon name="tabler-photo" class="h-4 w-4" />
      <% "puppet" -> %>
        <.icon name="tabler-mood-happy" class="h-4 w-4" />
      <% "stock footage" -> %>
        <.icon name="tabler-recycle" class="h-4 w-4" />
      <% "suit actor" -> %>
        <.icon name="tabler-meeple" class="h-4 w-4" />
      <% "voice" -> %>
        <.icon name="tabler-microphone-2" class="h-4 w-4" />
    <% end %>
    """
  end
end
