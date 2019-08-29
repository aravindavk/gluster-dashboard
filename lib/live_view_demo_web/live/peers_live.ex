defmodule LiveViewDemoWeb.PeersLive do
  use Phoenix.LiveView
  alias LiveViewDemoWeb.PeersView
  alias LiveViewDemo.Gluster

  @topic inspect(__MODULE__)

  def render(assigns) do
    PeersView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, put_peers_details(socket)}
  end

  defp put_peers_details(socket) do
    assign(socket, peers: Gluster.list_peers(), counts: Gluster.get_counts())
  end
end
