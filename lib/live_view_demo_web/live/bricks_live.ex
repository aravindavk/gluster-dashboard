defmodule LiveViewDemoWeb.BricksLive do
  use Phoenix.LiveView
  alias LiveViewDemoWeb.BricksView
  alias LiveViewDemo.Gluster

  @topic inspect(__MODULE__)

  def render(assigns) do
    BricksView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    Gluster.subscribe()
    {:ok, put_bricks_details(socket)}
  end

  def handle_info({Gluster, :cluster_changed}, socket) do
    {:noreply, put_bricks_details(socket)}
  end

  defp put_bricks_details(socket) do
    assign(socket, bricks: Gluster.list_bricks(), counts: Gluster.get_counts())
  end
end
