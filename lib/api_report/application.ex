defmodule ApiReport.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ApiReport.Repo,
      # Start the Telemetry supervisor
      ApiReportWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ApiReport.PubSub},
      # Start the Endpoint (http/https)
      ApiReportWeb.Endpoint
      # Start a worker by calling: ApiReport.Worker.start_link(arg)
      # {ApiReport.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApiReport.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ApiReportWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
