defmodule GlusterDashboardWeb.PeersLive do
  use Phoenix.LiveView
  alias GlusterDashboardWeb.PeersView
  alias GlusterDashboard.Gluster

  @topic inspect(__MODULE__)

  def render(assigns) do
    PeersView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    Gluster.subscribe()
    {:ok, put_peers_details(socket)}
  end

  def handle_info({Gluster, :cluster_changed}, socket) do
    {:noreply, put_peers_details(socket)}
  end

  defp put_peers_details(socket) do
    assign(socket, peers: Gluster.list_peers(), counts: Gluster.get_counts())
  end
end
