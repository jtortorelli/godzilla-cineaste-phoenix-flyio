defmodule GodzillaCineasteWeb.Films.ShowLive do
  use GodzillaCineasteWeb, :live_view

  import GodzillaCineasteWeb.CommonComponents

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, film: nil)}
  end

  @impl true
  def handle_params(%{"slug" => slug}, _uri, socket) do
    {:ok, film} = GodzillaCineaste.Films.get_film(slug)
    credits = GodzillaCineaste.Films.get_film_credits(slug)

    series =
      if film["series"]["slug"],
        do: GodzillaCineaste.Films.get_film_series(film["series"]["slug"]),
        else: nil

    {:noreply,
     assign(socket,
       film: film,
       credits: credits,
       series: series,
       page_title: film["title"]
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <h1 class="font-display tracking-wider uppercase p-2 text-2xl text-gray-700">
        {raw(process_title(@film["title"]))}
      </h1>
    </div>
    <.named_divider name="Overview" />
    <div class="lg:grid lg:grid-flow-col lg:auto-cols-auto lg:gap-4 lg:justify-center lg:items-center lg:max-w-2xl m-auto">
      <div class="pb-4 lg:shrink-0">
        <div class="text-center w-fit m-auto">
          <img class="rounded-lg drop-shadow-lg" height={400} width={270} src={@film["poster_url"]} />
        </div>
      </div>
      <div class="text-sm m-auto w-fit space-y-3 h-full">
        <div class="text-gray-700 font-content flex items-center gap-1">
          <div>
            <.icon name="tabler-calendar-event" class="h-5 w-4 text-gray-500" />
          </div>
          <div>{display_date(@film["release_date"])}</div>
        </div>
        <div class="text-gray-700 font-content flex items-center gap-1">
          <div>
            <.icon name="tabler-stopwatch" class="h-5 w-4 text-gray-500" />
          </div>
          <div>{"#{@film["runtime"]}m"}</div>
        </div>
        <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
          <div>
            <.icon name="tabler-language" class="text-gray-500 h-5 w-4" />
          </div>
          <div class="space-y-1">
            <div class="font-japanese tracking-wide text-gray-700">
              {raw(@film["japanese_title"])}
            </div>
            <div class="font-content italic text-xs text-gray-500">
              {@film["transliteration"]}
            </div>
            <%= if @film["transliteration"] != @film["translation"] do %>
              <div class="font-content italic text-xs text-gray-500">
                {@film["translation"]}
              </div>
            <% end %>
          </div>
        </div>
        <%= for work <- nil_safe_iterator(@film["original_works"]) do %>
          <div class="flex lg:break-inside-avoid-column gap-1 items-baseline">
            <div><.icon name="tabler-book" class="text-gray-500 h-4 w-4" /></div>
            <div>
              <div class="font-content italic text-gray-700">{work["title"]}</div>
              <div class="uppercase font-detail text-xs text-gray-500">{work["format"]} by</div>
              <%!-- <%= if Enum.empty?(work.authors) do %>
                  <%= for s <- work.studios do %>
                    <div class="font-content text-gray-700">
                      {s.display_name}
                    </div>
                  <% end %>
                <% else %> --%>
              <%= if work["authors"] && not Enum.empty?(work["authors"]) do %>
                <%= for a <- work["authors"] do %>
                  <div class="font-content text-gray-700">
                    <.person_showcase_link slug={a["slug"]}>{a["name"]}</.person_showcase_link>
                  </div>
                <% end %>
              <% end %>
              <%= if work["studios"] && not Enum.empty?(work["studios"]) do %>
                <div class="font-content text-gray-700">
                  <%= for studio <- work["studios"] do %>
                    {studio["name"]}<br />
                  <% end %>
                </div>
              <% end %>
              <%!-- <% end %> --%>
            </div>
          </div>
        <% end %>
        <%= if not Enum.empty?(nil_safe_iterator(@film["aliases"])) do %>
          <div class="space-y-1">
            <%= for alias <- nil_safe_iterator(@film["aliases"]) do %>
              <div class="lg:break-inside-avoid-column flex gap-1 items-baseline">
                <div><.icon name="tabler-at" class="text-gray-500 h-5 w-4" /></div>
                <div>
                  <div class="font-content italic text-gray-700">{alias["alias"]}</div>
                  <div class="font-detail text-xs text-gray-500">
                    {alias["context"]}
                  </div>
                </div>
              </div>
            <% end %>
          </div>
        <% end %>
        <%= if @film["series"] do %>
          <div class="lg:break-inside-avoid-column space-y-1">
            <div class="text-gray-700 flex font-content gap-1 items-baseline">
              <div><.icon name="tabler-affiliate" class="text-gray-500 h-5 w-4" /></div>
              <div class="flex gap-1 items-baseline">
                <div>
                  <i>{@film["series"]["title"]}</i> Series No. {@film["series"]["entry_number"]}
                </div>
                <div>
                  <a phx-click={show_modal("series-modal")}>
                    <.icon
                      name="tabler-layers-subtract"
                      class="pl-1 text-red-700 hover:cursor-pointer h-5 w-4"
                    />
                  </a>
                </div>
              </div>
            </div>

            <.series_modal series={@series} />
            <%= if @film["series"]["previous_entry"] do %>
              <div class="flex gap-1 items-baseline font-content">
                <div>
                  <.icon name="tabler-square-rounded-arrow-left" class="text-gray-500 h-5 w-4" />
                </div>
                <div>
                  <.film_showcase_link slug={@film["series"]["previous_entry"]["slug"]}>
                    <span class="italic text-wrap">{@film["series"]["previous_entry"]["title"]}</span>
                    <span class="text-sm">
                      ({@film["series"]["previous_entry"]["year"]})
                    </span>
                  </.film_showcase_link>
                </div>
              </div>
            <% end %>
            <%= if @film["series"]["next_entry"] do %>
              <div class="flex gap-1 items-baseline font-content">
                <div>
                  <.icon name="tabler-square-rounded-arrow-right" class="text-gray-500 h-5 w-4" />
                </div>
                <div>
                  <.film_showcase_link slug={@film["series"]["next_entry"]["slug"]}>
                    <span class="italic text-wrap">{@film["series"]["next_entry"]["title"]}</span>
                    <span class="text-sm">({@film["series"]["next_entry"]["year"]})</span>
                  </.film_showcase_link>
                </div>
              </div>
            <% end %>
          </div>
        <% end %>

        <div class="font-content text-gray-700 flex gap-1 items-baseline">
          <div><.icon name="tabler-buildings" class="text-gray-500 h-5 w-4" /></div>
          <div>
            <div class="font-content text-gray-700">
              <%= for studio <- @film["studios"] do %>
                {studio}<br />
              <% end %>
            </div>
          </div>
        </div>
      </div>
    </div>
    <.named_divider name="Staff" />
    <div class="max-w-96 m-auto lg:columns-3 lg:gap-x-8 w-fit">
      <%= for staff <- @film["staff"] do %>
        <div class="lg:text-center text-left lg:break-inside-avoid-column pb-1">
          <div class="">
            <span class="font-detail text-xs uppercase text-gray-500">{staff["role"]}</span>
          </div>
          <div class="">
            <%= for person <- staff["people"] do %>
              <div class="text-gray-700 text-sm font-content">
                <.person_showcase_link slug={person["slug"]}>
                  {raw(
                    if person["disambig_chars"] do
                      person["name"] <>
                        ~s| <span class="text-xs">(<span class="font-japanese">#{person["disambig_chars"]}</span>)</span>|
                    else
                      person["name"]
                    end
                  )}
                </.person_showcase_link>

                <br />
                <%= if person["alias"] do %>
                  <span class="text-gray-500 text-xs">
                    <.icon name="tabler-at" class="h-3 w-3" />{person["alias"]}
                  </span>
                <% end %>
              </div>
            <% end %>
          </div>
        </div>
      <% end %>
    </div>
    <div
      :if={@credits}
      class="w-fit m-auto font-detail text-xs text-red-700 hover:cursor-pointer pt-2"
    >
      <a phx-click={show_modal("credits-modal")} class="uppercase">
        Full Cast & Crew <.icon name="tabler-layers-subtract" class="h-4 w-4" />
      </a>
      <.full_credits_modal film={@film} credits={@credits} />
    </div>
    <.named_divider name="top billed cast" />
    <.cast_block block={@film["top_billed_cast"]} />
    <%= if not Enum.empty?(nil_safe_iterator(@film["supporting_cast"])) do %>
      <.named_divider name="supporting cast" />
      <.cast_block block={@film["supporting_cast"]} />
    <% end %>
    <%= if not Enum.empty?(nil_safe_iterator(@film["kaiju"])) do %>
      <.named_divider name="kaiju, etc." />
      <div class="flex flex-col sm:flex-row sm:flex-wrap sm:w-fit w-96 m-auto gap-4">
        <%= for kaiju <- nil_safe_iterator(@film["kaiju"]) do %>
          <div class="flex flex-row sm:flex-col sm:w-32 items-center gap-3">
            <div class="shrink-0">
              <img
                class="h-[75px] w-[75px] sm:h-[100px] sm:w-[100px] max-w-[150px] rounded-lg drop-shadow-lg"
                src={kaiju["avatar_url"]}
              />
            </div>
            <div class="flex flex-col sm:items-center">
              <div class="font-content text-gray-500 text-xs">{kaiju["name"]}</div>
              <%= for portrayal <- kaiju["portrayals"] do %>
                <%= if portrayal["people"] do %>
                  <%= for person <- portrayal["people"] do %>
                    <div class="font-content text-sm sm:text-center text-gray-700">
                      <.person_showcase_link slug={person["slug"]}>
                        {person["name"]}
                      </.person_showcase_link>

                      <%= if person["alias"] do %>
                        <div class="font-content text-xs text-gray-500">
                          <.icon name="tabler-at" class="text-gray-500 h-3 w-3" />{person["alias"]}
                        </div>
                      <% end %>
                      <div class="font-detail text-xs text-gray-500 uppercase">
                        <.qualifier_icon qualifier={portrayal["type"]} />
                      </div>
                    </div>
                  <% end %>
                <% else %>
                  <div class="font-detail text-xs text-gray-500 uppercase">
                    <.qualifier_icon qualifier={portrayal["type"]} />
                  </div>
                <% end %>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>
    <% end %>
    """
  end

  def cast_block(assigns) do
    ~H"""
    <div class="flex flex-col sm:flex-row sm:flex-wrap gap-4 sm:w-fit w-96 m-auto">
      <%= for cast <- @block do %>
        <div class="flex flex-row sm:flex-col sm:w-32 items-center gap-3">
          <div class="shrink-0">
            <img
              class="h-[75px] w-[75px] sm:h-[100px] sm:w-[100px] max-w-[150px] rounded-lg drop-shadow-lg"
              src={cast["avatar_url"]}
            />
          </div>
          <div class="flex flex-col sm:items-center">
            <div class="font-content sm:text-center text-gray-500 text-xs">
              {raw(process_role_name(cast["role"]))}
              <%= if cast["character_qualifiers"] do %>
                <br />
                <span class="text-xs font-detail">
                  {cast["character_qualifiers"]}
                </span>
              <% end %>
            </div>
            <div class="font-content text-sm sm:text-center text-gray-700">
              <.person_showcase_link slug={cast["slug"]}>
                {cast["name"]}
                <%= if cast["disambig_chars"] do %>
                  <span class="text-xs">
                    (<span class="font-japanese">{cast["disambig_chars"]}</span>)
                  </span>
                <% end %>
              </.person_showcase_link>
            </div>
            <%= if cast["alias"] do %>
              <div class="font-content text-xs text-gray-500">
                <.icon name="tabler-at" class="text-gray-500 h-3 w-3" />{cast["alias"]}
              </div>
            <% end %>
            <div class="font-detail text-xs text-gray-500 uppercase">
              <%= if cast["qualifiers"]  do %>
                <.qualifier_icon qualifier={cast["qualifiers"]} />
              <% end %>
              <%= if cast["uncredited"] do %>
                <.icon name="tabler-id-off" class="text-red-700 h-4 w-4" />
              <% end %>
            </div>
            <%= if cast["secondary"] do %>
              <%= for secondary <- cast["secondary"] do %>
                <div class="font-content text-sm sm:text-center text-gray-700">
                  <.person_showcase_link slug={secondary["slug"]}>
                    {secondary["name"]}
                    <%= if secondary["disambig_chars"] do %>
                      <span class="text-xs">
                        (<span class="font-japanese">{secondary["disambig_chars"]}</span>)
                      </span>
                    <% end %>
                  </.person_showcase_link>
                </div>
                <%= if secondary["alias"] do %>
                  <div class="font-content text-xs text-gray-500">
                    <.icon name="tabler-at" class="text-gray-500 h-3 w-3" />{secondary["alias"]}
                  </div>
                <% end %>
                <div class="font-detail text-xs text-gray-500 uppercase">
                  <%= if secondary["qualifiers"]  do %>
                    <.qualifier_icon qualifier={secondary["qualifiers"]} />
                  <% end %>
                  <%= if secondary["uncredited"] do %>
                    <.icon name="tabler-id-off" class="text-red-700 h-4 w-4" />
                  <% end %>
                </div>
              <% end %>
            <% end %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  def series_modal(assigns) do
    ~H"""
    <.modal id="series-modal">
      <div class="max-h-[80vh] overflow-y-auto">
        <div class="font-display uppercase text-center pb-2 text-gray-700">
          {@series["name"]}
          <br /><span class="text-xs text-gray-500 font-extrabold">Series</span>
        </div>
        <div class="text-gray-700 font-content text-sm">
          <ol class="list-decimal list-outside gap-2">
            <%= for series_entry <- @series["entries"] do %>
              <li class="ml-8 my-1 text-red-700">
                <%= if series_entry["slug"] do %>
                  <.link href={~p"/films/#{series_entry["slug"]}"} class="hover:cursor-pointer">
                    <i>
                      {series_entry["title"]}
                    </i>
                    ({series_entry["year"]})
                  </.link>
                <% else %>
                  <i>
                    {series_entry["title"]}
                  </i>
                  ({series_entry["year"]})
                <% end %>
              </li>
            <% end %>
          </ol>
        </div>
      </div>
    </.modal>
    """
  end

  def full_credits_modal(assigns) do
    ~H"""
    <.modal id="credits-modal">
      <div class="max-h-[80vh] overflow-y-auto">
        <div class="font-display uppercase text-center pb-2 text-gray-700">
          {@film["title"]}
          <br /><span class="text-xs text-gray-500 font-extrabold">Full Cast & Crew</span>
        </div>
        <div class="grid grid-cols-2 gap-2 text-gray-700 font-content text-sm">
          <%= for [jpn_role, jpn_name, eng_role, eng_name] <- @credits do %>
            <div>
              <span class="text-gray-500 font-mono text-xs">{jpn_role}</span> <br />
              <span>{eng_role}</span>
            </div>
            <div>
              <span class="text-gray-500 font-mono text-xs">{jpn_name}</span> <br />
              <span>{eng_name}</span>
            </div>
          <% end %>
        </div>
      </div>
    </.modal>
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

  defp process_title(title) do
    title
    |> String.replace("20th", "20<span class=\"align-top text-lg\">th</span>")
    |> String.replace("3rd", "3<span class=\"align-top text-lg\">rd</span>")
  end

  defp process_role_name(role_name) do
    role_name
    |> String.replace("-maru", "<span class=\"italic\">-maru</span>")
    |> String.replace("-seijin", "<span class=\"italic\">-seijin</span>")
    |> String.replace("Gôtengô", "<span class=\"italic\">Gôtengô</span>")
    |> String.replace("Eclair", "<span class=\"italic\">Eclair</span>")
    |> String.replace("Karyû", "<span class=\"italic\">Karyû</span>")
  end
end
