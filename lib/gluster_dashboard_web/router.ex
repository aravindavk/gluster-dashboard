defmodule GlusterDashboardWeb.Router do
  use GlusterDashboardWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Phoenix.LiveView.Flash
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GlusterDashboardWeb do
    pipe_through :browser

    get "/", DashboardController, :volumes
    get "/dashboard", DashboardController, :volumes
    get "/dashboard/volumes", DashboardController, :volumes
    get "/dashboard/volumes/:volname", DashboardController, :volumes_detail
    get "/dashboard/peers", DashboardController, :peers
    get "/dashboard/bricks", DashboardController, :bricks
  end

  # Other scopes may use custom stacks.
  scope "/api", GlusterDashboardWeb do
    pipe_through :api

    post "/webhook", WebhookController, :create_or_update
  end
end
