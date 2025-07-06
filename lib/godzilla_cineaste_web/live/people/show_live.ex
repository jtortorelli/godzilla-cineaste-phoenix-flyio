defmodule GodzillaCineasteWeb.People.ShowLive do
  use GodzillaCineasteWeb, :live_view

  import GodzillaCineasteWeb.PeopleComponents
  import GodzillaCineasteWeb.CommonComponents

  alias GodzillaCineaste.People

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, person: nil)}
  end

  @impl true
  def handle_params(%{"slug" => slug}, _uri, socket) do
    {:ok, person} = People.get_person(slug)
    {:noreply, assign(socket, person: person, page_title: person["name"])}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <h1 class="font-display tracking-wider uppercase text-2xl text-gray-700 p-4">
        {@person["name"]}
      </h1>
    </div>
    <.named_divider name="Overview" />
    <div class="flex flex-col justify-center lg:grid lg:grid-flow-col lg:auto-cols-auto lg:gap-4 lg:items-center lg:justify-center lg:max-w-2xl m-auto mb-1">
      <div class="pb-4 lg:shrink-0 h-full w-fit m-auto">
        <img
          class="rounded-lg drop-shadow-lg"
          src={@person["avatar_url"]}
          height="200px"
          width="200px"
        />
      </div>
      <div class="text-sm m-auto space-y-3 h-full">
        <%= if @person["japanese_name"] do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-language" class="text-gray-500 h-5 w-4" /></div>
            <div class="font-japanese text-gray-700">{@person["japanese_name"]}</div>
          </div>
        <% end %>
        <%= if @person["dob"] do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div>
              <.icon name="tabler-sun-high" class="text-gray-500 h-5 w-4" />
            </div>
            <div class="space-y-1">
              <div class="font-content text-gray-700">
                {display_date(@person["dob"])}
                <%= if !@person["dod"] do %>
                  ({age(@person["dob"])})
                <% end %>
              </div>
              <%= if @person["birth_name"] do %>
                <div class="font-content text-gray-500 text-xs">{@person["birth_name"]}</div>
              <% end %>
              <%= if @person["birth_place"] do %>
                <div class="font-content text-gray-500 text-xs">
                  {@person["birth_place"]}
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
        <%= if @person["dod"] && String.downcase(@person["dod"]) != "unknown" do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-moon" class="text-gray-500 h-5 w-4" /></div>
            <div class="space-y-1">
              <div class="font-content text-gray-700">
                {display_date(@person["dod"])} ({lifespan(
                  @person["dob"],
                  @person["dod"]
                )})
              </div>
              <%= if @person["death_place"] do %>
                <div class="font-content text-gray-500 text-xs">
                  {@person["death_place"]}
                </div>
              <% end %>
              <%= if @person["cause_of_death"] do %>
                <div class="font-content text-gray-500 text-xs">
                  {@person["cause_of_death"]}
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
        <%= if String.downcase(@person["dod"]) == "unknown" do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-moon" class="text-gray-500 h-5 w-4" /></div>
            <div class="font-content text-gray-700">Unknown Date</div>
          </div>
        <% end %>
        <%= if !!@person["aliases"] and not Enum.empty?(@person["aliases"]) do %>
          <%= for a <- @person["aliases"] do %>
            <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
              <div><.icon name="tabler-at" class="text-gray-500 h-5 w-4" /></div>
              <div>
                <div class="font-content text-gray-700">{a["name"]}</div>
                <%= if a["japanese_name"] do %>
                  <div class="font-content text-gray-500 text-xs">{a["japanese_name"]}</div>
                <% end %>
                <%= if a["context"] do %>
                  <div class="font-content text-gray-500 text-xs">{a["context"]}</div>
                <% end %>
              </div>
            </div>
          <% end %>
        <% end %>
        <%= if !!@person["spouses"] and not Enum.empty?(@person["spouses"]) do %>
          <%= for spouse <- @person["spouses"] do %>
            <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
              <div><.icon name="tabler-chart-circles" class="text-gray-500 h-5 w-5" /></div>
              <div>
                <div class="font-content text-gray-500">
                  <%= if spouse["slug"] do %>
                    <.link
                      class="underline decoration-gray-300 decoration-1 underline-offset-2 hover:cursor-pointer hover:text-red-700 hover:decoration-red-700"
                      href={~p"/v2/people/#{spouse["slug"]}"}
                    >
                      {spouse["name"]}
                    </.link>
                  <% else %>
                    {spouse["name"]}
                  <% end %>
                </div>
              </div>
            </div>
          <% end %>
        <% end %>
        <%= if !!@person["family"] and not Enum.empty?(@person["family"]) do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-users-group" class="text-gray-500 h-5 w-5" /></div>
            <div>
              <%= for family <- @person["family"] do %>
                <div class="font-content text-gray-500">
                  <%= if family["slug"] do %>
                    <.link
                      class="underline decoration-gray-300 decoration-1 underline-offset-2 hover:cursor-pointer hover:text-red-700 hover:decoration-red-700"
                      href={~p"/v2/people/#{family["slug"]}"}
                    >
                      {family["name"]}
                    </.link>
                  <% else %>
                    {family["name"]}
                  <% end %>
                </div>
                <div class="font-content text-gray-500 text-xs capitalize">
                  {family["relationship"]}
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    <%= if @person["bio"] && !Enum.empty?(@person["bio"]) do %>
      <%= for b <- @person["bio"] do %>
        <div class="text-sm font-content text-gray-700 mb-1 w-96 mx-auto">
          {raw(b)}
        </div>
      <% end %>
    <% end %>
    <%= if @person["accolades"] && !Enum.empty?(@person["accolades"]) do %>
      <.named_divider name="Accolades" />
      <div class="flex flex-col sm:flex-row sm:flex-wrap gap-4 m-auto sm:w-fit w-96">
        <%= for accolade <- @person["accolades"] do %>
          <div class={"font-content text-xs gap-1 #{if accolade["status"] == "won", do: "text-amber-600", else: "text-gray-700"}"}>
            <div class="flex items-end gap-1">
              <div>
                <.icon
                  name={
                    if accolade["status"] == "won", do: "tabler-award-filled", else: "tabler-award"
                  }
                  class="h-4 w-4"
                />
              </div>
              <div class={"uppercase font-detail #{if accolade["status"] != "won", do: "text-gray-500"}"}>
                {if accolade["status"] == "won", do: "Won", else: "Nominated"}
              </div>
            </div>
            <div>
              <div>
                {accolade["ceremony"]}
              </div>
              <div>{accolade["category"]}</div>
              <div class="italic">
                {accolade["films"] |> Enum.map(& &1["title"]) |> Enum.join(", ")}
              </div>
            </div>
          </div>
        <% end %>
      </div>
    <% end %>
    <.named_divider name="Selected Works" />
    <div class="full-filmography">
      <div class="flex flex-col sm:flex-row sm:flex-wrap gap-4 m-auto sm:w-fit w-96">
        <%= for entry <- @person["works"] do %>
          <%!-- <.person_filmography_entry entry={entry} /> --%>
        <% end %>
      </div>
    </div>
    """
  end

  defp age(dob_string) do
    dob_string
    |> Date.from_iso8601!()
    |> then(&Date.diff(Date.utc_today(), &1))
    |> div(365)
  end

  defp lifespan(dob_string, dod_string) do
    dob = Date.from_iso8601!(dob_string)
    dod = Date.from_iso8601!(dod_string)

    Date.diff(dod, dob) |> div(365)
  end
end
