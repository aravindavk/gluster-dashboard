defmodule LiveViewDemoWeb.Router do
  use LiveViewDemoWeb, :router

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

  scope "/", LiveViewDemoWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/clock", ClockLive

    get "/dashboard", DashboardController, :volumes
    get "/dashboard/volumes", DashboardController, :volumes
    get "/dashboard/volumes/:volname", DashboardController, :volumes_detail
    get "/dashboard/peers", DashboardController, :peers
    get "/dashboard/bricks", DashboardController, :bricks
  end

  # Other scopes may use custom stacks.
  scope "/api", LiveViewDemoWeb do
    pipe_through :api

    post "/webhook", WebhookController, :create_or_update
  end
end
