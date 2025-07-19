defmodule GodzillaCineasteWeb.People.ShowLive do
  use GodzillaCineasteWeb, :live_view

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
        <%= if @person["type"] == "group" && @person["active_period_start"] do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-calendar-time" class="text-gray-500 h-5 w-4" /></div>
            <div class="font-content text-gray-700">
              {@person["active_period_start"]} - {@person["active_period_end"] || "Present"}
            </div>
          </div>
        <% end %>
        <%= if @person["dob"] do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div>
              <.icon name="tabler-sun-high" class="text-gray-500 h-5 w-4" />
            </div>
            <div class="space-y-1">
              <div class="font-content text-gray-700">
                {display_date(@person["dob"], @person["dob_resolution"])}
                <%= if !@person["dod"] do %>
                  ({age(@person["dob"])})
                <% end %>
              </div>
              <%= if @person["birth_name"] do %>
                <div class="font-content text-gray-500 text-xs">{@person["birth_name"]}</div>
              <% end %>
              <%= if @person["japanese_birth_name"] do %>
                <div class="font-content text-gray-500 text-xs">
                  {@person["japanese_birth_name"]}
                </div>
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
                {display_date(@person["dod"], @person["dod_resolution"])} ({lifespan(
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
        <%= if String.downcase(@person["dod"] || "") == "unknown" do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-moon" class="text-gray-500 h-5 w-4" /></div>
            <div class="font-content text-gray-700">Unknown Date</div>
          </div>
        <% end %>
        <%= for a <- nil_safe_iterator(@person["aliases"]) do %>
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
              <%= if a["category"] == "mistranslation" do %>
                <div class="font-content text-gray-500 text-xs">
                  Mistranslation
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
        <%= for spouse <- nil_safe_iterator(@person["spouses"]) do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-chart-circles" class="text-gray-500 h-5 w-5" /></div>
            <div>
              <div class="font-content text-gray-700">
                <.person_showcase_link slug={spouse["slug"]}>
                  {spouse["name"]}
                </.person_showcase_link>
              </div>
            </div>
          </div>
        <% end %>
        <%= if not Enum.empty?(nil_safe_iterator(@person["family"])) do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-users-group" class="text-gray-500 h-5 w-5" /></div>
            <div>
              <%= for family <- nil_safe_iterator(@person["family"]) do %>
                <div class="font-content text-gray-700">
                  <.person_showcase_link slug={family["slug"]}>
                    {family["name"]}
                  </.person_showcase_link>
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
    <%= for b <- nil_safe_iterator(@person["bio"]) do %>
      <div class="text-sm font-content text-gray-700 mb-1 w-96 mx-auto">
        {raw(b)}
      </div>
    <% end %>
    <%= if @person["type"] == "group" && not Enum.empty?(nil_safe_iterator(@person["members"])) do %>
      <.named_divider name="Members" />
      <div class="w-96 m-auto sm:w-fit flex flex-col sm:flex-row flex-wrap gap-6 justify-center">
        <%= for member <- @person["members"] do %>
          <div class="flex flex-col text-sm gap-3">
            <div class="sm:text-center text-base font-content text-gray-700">
              {member["name"]}
            </div>
            <div>
              <%= if member["dob"] do %>
                <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
                  <div>
                    <.icon name="tabler-sun-high" class="text-gray-500 h-5 w-4" />
                  </div>
                  <div class="space-y-1">
                    <div class="font-content text-gray-700">
                      {display_date(member["dob"], member["dob_resolution"])}
                      <%= if !member["dod"] do %>
                        ({age(member["dob"])})
                      <% end %>
                    </div>
                    <%= if member["birth_name"] do %>
                      <div class="font-content text-gray-500 text-xs">{member["birth_name"]}</div>
                    <% end %>
                    <%= if member["japanese_birth_name"] do %>
                      <div class="font-content text-gray-500 text-xs">
                        {member["japanese_birth_name"]}
                      </div>
                    <% end %>
                    <%= if member["birth_place"] do %>
                      <div class="font-content text-gray-500 text-xs">
                        {member["birth_place"]}
                      </div>
                    <% end %>
                  </div>
                </div>
              <% end %>
            </div>
            <div>
              <%= if member["dod"] && String.downcase(member["dod"]) != "unknown" do %>
                <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
                  <div><.icon name="tabler-moon" class="text-gray-500 h-5 w-4" /></div>
                  <div class="space-y-1">
                    <div class="font-content text-gray-700">
                      {display_date(member["dod"], member["dod_resolution"])} ({lifespan(
                        member["dob"],
                        member["dod"]
                      )})
                    </div>
                    <%= if member["death_place"] do %>
                      <div class="font-content text-gray-500 text-xs">
                        {member["death_place"]}
                      </div>
                    <% end %>
                    <%= if member["cause_of_death"] do %>
                      <div class="font-content text-gray-500 text-xs">
                        {member["cause_of_death"]}
                      </div>
                    <% end %>
                  </div>
                </div>
              <% end %>
              <%= if String.downcase(@person["dod"] || "") == "unknown" do %>
                <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
                  <div><.icon name="tabler-moon" class="text-gray-500 h-5 w-4" /></div>
                  <div class="font-content text-gray-700">Unknown Date</div>
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>
    <% end %>
    <%= if not Enum.empty?(nil_safe_iterator(@person["accolades"])) do %>
      <.named_divider name="Accolades" />
      <div class="flex flex-col sm:flex-row sm:flex-wrap gap-4 m-auto sm:w-fit w-96">
        <%= for accolade <- nil_safe_iterator(@person["accolades"]) do %>
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
          <%= if String.downcase(entry["format"]) == "tv series" do %>
            <div class="flex flex-row w-60 items-start gap-3">
              <div class="shrink-0">
                <img class="rounded-lg drop-shadow-lg" width={101} src={entry["title_card_url"]} />
              </div>
              <div>
                <div class="font-content text-xs text-gray-500 flex items-baseline gap-1">
                  <div>
                    <.icon name="tabler-device-tv-old" class="h-5 w-4" />
                  </div>
                  <div>
                    {entry["year"]}
                  </div>
                </div>
                <div class="font-content text-sm text-gray-700 mb-1">
                  <span class="italic">{entry["title"]}</span>
                </div>
                <%= for s <- nil_safe_iterator(entry["staff"]) do %>
                  <div class="font-content text-xs text-gray-500 flex">
                    <div>
                      <.icon name="tabler-chair-director" class="h-4 w-4" />
                    </div>
                    <div>
                      <div>
                        {s["role"]}
                      </div>
                    </div>
                  </div>
                <% end %>
                <%= for r <- nil_safe_iterator(entry["roles"]) do %>
                  <div class="font-content text-xs text-gray-500 flex gap-1">
                    <div>
                      <.icon name="tabler-masks-theater" class="h-4 w-4" />
                    </div>
                    <div>
                      <div>
                        {raw(process_role_name(r["name"]))}
                      </div>
                      <div>
                        {r["episode_count"]} {if r["episode_count"] > 1,
                          do: "Episodes",
                          else: "Episode"}
                      </div>
                    </div>
                  </div>
                <% end %>
              </div>
            </div>
          <% end %>
          <%= if String.downcase(entry["format"]) == "film" do %>
            <div class="flex flex-row w-60 items-start gap-3">
              <div class="shrink-0">
                <img
                  class="rounded-lg drop-shadow-lg min-h-[150px]"
                  height={150}
                  width={101}
                  src={entry["poster_url"]}
                />
              </div>
              <div>
                <div class="font-content text-xs text-gray-500 flex items-baseline gap-1">
                  <div>
                    <.icon name="tabler-movie" class="h-5 w-4" />
                  </div>
                  <div>
                    {entry["year"]}
                  </div>
                </div>
                <div class="font-content text-sm text-gray-700 mb-1">
                  <.film_showcase_link slug={entry["slug"]}>
                    <span class="italic">{entry["title"]}</span>
                  </.film_showcase_link>
                </div>
                <%= for s <- nil_safe_iterator(entry["staff"]) do %>
                  <div class="font-content text-xs text-gray-500 flex">
                    <div>
                      <.icon name="tabler-chair-director" class="h-4 w-4" />
                    </div>
                    <div>
                      <div>
                        {s["role"]}
                      </div>
                      <%= if s["staff_alias"] do %>
                        <div>
                          <.icon name="tabler-at" class="h-3 w-3" />{s["staff_alias"]}
                        </div>
                      <% end %>
                    </div>
                  </div>
                <% end %>
                <%= for r <- nil_safe_iterator(entry["kaiju_roles"]) ++ nil_safe_iterator(entry["roles"]) do %>
                  <div class="font-content text-xs text-gray-500 flex gap-1">
                    <div>
                      <.icon name="tabler-masks-theater" class="h-4 w-4" />
                    </div>
                    <div>
                      <div>
                        {raw(process_role_name(r["name"]))}
                      </div>
                      <%= if r["actor_alias"] do %>
                        <.icon name="tabler-at" class="h-3 w-3" />{r["actor_alias"]}
                      <% end %>
                      <%= for q <- nil_safe_iterator(r["qualifiers"]) do %>
                        <.qualifier_icon qualifier={q} />
                      <% end %>
                      <%= if r["uncredited"] do %>
                        <.icon name="tabler-id-off" class="text-red-700 h-3 w-3" />
                      <% end %>
                    </div>
                  </div>
                <% end %>
              </div>
            </div>
          <% end %>
          <%= if String.downcase(entry["format"]) == "book" do %>
            <div class="flex flex-row w-60 items-start gap-3">
              <div class="shrink-0">
                <img
                  class="rounded-lg drop-shadow-lg min-h-[125px]"
                  height={125}
                  width={101}
                  src={entry["cover_url"]}
                />
              </div>
              <div>
                <div class="font-content text-xs text-gray-500 flex items-baseline gap-1">
                  <div>
                    <.icon name="tabler-book" class="h-5 w-4" />
                  </div>
                  <div>
                    {entry["year"]}
                  </div>
                </div>
                <div class="font-content text-sm text-gray-700 mb-1">
                  <span class="italic">{entry["title"]}</span>
                </div>
                <%= for s <- nil_safe_iterator(entry["staff"]) do %>
                  <div class="font-content text-xs text-gray-500 flex gap-1">
                    <div>
                      <.icon name="tabler-pencil" class="h-4 w-4" />
                    </div>
                    <div>
                      <div>
                        {s["role"]}
                      </div>
                    </div>
                  </div>
                <% end %>
              </div>
            </div>
          <% end %>
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
