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
  end

  # Other scopes may use custom stacks.
  scope "/api", LiveViewDemoWeb do
    pipe_through :api

    post "/webhook/volumes", WebhookVolumeController, :create_or_update
    post "/webhook/peers", WebhookPeerController, :create_or_update
  end
end
