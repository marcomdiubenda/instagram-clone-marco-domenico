defmodule InstagramCloneMD.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      InstagramCloneMDWeb.Telemetry,
      InstagramCloneMD.Repo,
      {DNSCluster, query: Application.get_env(:instagram_clone_m_d, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: InstagramCloneMD.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: InstagramCloneMD.Finch},
      # Start a worker by calling: InstagramCloneMD.Worker.start_link(arg)
      # {InstagramCloneMD.Worker, arg},
      # Start to serve requests, typically the last entry
      InstagramCloneMDWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InstagramCloneMD.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InstagramCloneMDWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
