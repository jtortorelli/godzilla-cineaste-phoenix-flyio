defmodule GodzillaCineaste.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GodzillaCineasteWeb.Telemetry,
      # Start the Ecto repository
      CineasteData.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GodzillaCineaste.PubSub},
      # Start Finch
      {Finch, name: GodzillaCineaste.Finch},
      # Start the Endpoint (http/https)
      GodzillaCineasteWeb.Endpoint
      # Start a worker by calling: GodzillaCineaste.Worker.start_link(arg)
      # {GodzillaCineaste.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GodzillaCineaste.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GodzillaCineasteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
