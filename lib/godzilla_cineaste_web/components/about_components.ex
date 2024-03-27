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
  slot :inner_block, required: true

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
    <div class="text-sm font-extrabold font-display uppercase w-fit m-auto text-center  text-gray-500">
      <div class="flex flex-col sm:flex-row">
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
      </div>
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
    <div>
      <a
        href={@href}
        class={"inline-block p-1 px-4 rounded-t-lg #{if @active, do: active_classes, else: inactive_classes}"}
      >
        <%= @title %>
      </a>
    </div>
    """
  end

  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  attr :alias, :string, default: nil
  attr :domain, :string, default: nil
  attr :url, :string, default: nil
  attr :author, :string, default: nil
  attr :image_url, :string, default: nil
  attr :isbn, :string, default: nil
  attr :history, :string, default: nil
  slot :works, default: nil

  def acknowledgement_card(assigns) do
    ~H"""
    <div class="p-5">
      <%= if @image_url do %>
        <div class="lg:h-[150px] flex lg:items-center justify-center">
          <div>
            <.maybe_link_url url={@url}>
              <img class="max-h-[150px] max-w-xs rounded-lg drop-shadow-lg" src={@image_url} />
            </.maybe_link_url>
          </div>
        </div>
      <% end %>
      <div class="text-center">
        <div class="font-content text-gray-700">
          <.maybe_link_url url={@url}>
            <%= @title %>
          </.maybe_link_url>
        </div>
        <%= if @subtitle do %>
          <div class="font-content text-gray-700 text-sm">
            <%= @subtitle %>
          </div>
        <% end %>
        <%= if @alias do %>
          <div class="font-content text-sm text-gray-500">aka <%= @alias %></div>
        <% end %>
        <%= if @domain do %>
          <div class="font-detail text-red-500 text-xs">
            <.maybe_link_url url={@url}>
              <%= @domain %>
            </.maybe_link_url>
          </div>
        <% end %>
        <%= if @history do %>
          <div class="font-content text-sm text-gray-700"><%= @history %></div>
        <% end %>
        <%= if @isbn do %>
          <div class="font-detail text-red-500 text-xs">
            ISBN: <%= @isbn %>
          </div>
        <% end %>
        <%= if @author do %>
          <div class="font-content text-sm text-gray-700"><%= @author %></div>
        <% end %>
        <%= if @works do %>
          <div class="font-content text-sm text-gray-500">
            <%= render_slot(@works) %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  attr :url, :string, default: nil
  slot :inner_block, required: true

  def maybe_link_url(assigns) do
    ~H"""
    <%= if @url do %>
      <a href={@url}><%= render_slot(@inner_block) %></a>
    <% else %>
      <%= render_slot(@inner_block) %>
    <% end %>
    """
  end
end
