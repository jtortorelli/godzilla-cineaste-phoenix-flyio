defmodule GodzillaCineasteWeb.AdminLive do
  use GodzillaCineasteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket, layout: {GodzillaCineasteWeb.Layouts, :admin}}
  end
end
