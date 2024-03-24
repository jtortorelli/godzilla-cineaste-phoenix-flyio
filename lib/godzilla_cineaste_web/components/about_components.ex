defmodule GodzillaCineasteWeb.AboutComponents do
  use GodzillaCineasteWeb, :html

  def timeline(assigns) do
    ~H"""
    <div>
      <ol class="relative border-l border-red-700">
        <%= render_slot(@inner_block) %>
      </ol>
    </div>
    """
  end

  attr :time, :string, required: true

  def timeline_node(assigns) do
    ~H"""
    <li class="mb-10 ml-4">
      <div class="flex flex-col">
        <div class="absolute w-3 h-3 rounded-full bg-red-700 -left-1.5 border border-white"></div>
        <time class="mb-1 text-sm font-detail leading-none text-gray-500"><%= @time %></time>
        <p class="mb-4 font-content text-justify text-gray-700"><%= render_slot(@inner_block) %></p>
      </div>
    </li>
    """
  end

  attr :active_section, :atom, values: ~w(gist history acknowledgements)a, required: true

  def about_title(assigns) do
    ~H"""
    <div class="text-center w-fit m-auto">
      <h1 class="font-display tracking-wider uppercase p-4 text-2xl text-gray-700">About</h1>
    </div>
    <div class="text-xs font-extrabold font-display uppercase w-fit m-auto text-center  text-gray-500">
      <ul class="flex flex-wrap -mb-px">
        <.about_section_link active={@active_section == :gist} href={~p"/about"} title="The Gist" />
        <.about_section_link
          active={@active_section == :history}
          href={~p"/about/history"}
          title="History"
        />
        <.about_section_link
          active={@active_section == :acknowledgements}
          href={~p"/about/acknowledgements"}
          title="Acknowledgements"
        />
      </ul>
    </div>
    """
  end

  attr :active, :boolean, required: true
  attr :href, :string, required: true
  attr :title, :string, required: true

  def about_section_link(assigns) do
    active_classes = "border-red-700 text-red-700"
    inactive_classes = "hover:text-gray-700"

    ~H"""
    <li class="me-2">
      <a
        href={@href}
        class={"inline-block p-4 rounded-t-lg #{if @active, do: active_classes, else: inactive_classes}"}
      >
        <%= @title %>
      </a>
    </li>
    """
  end
end
