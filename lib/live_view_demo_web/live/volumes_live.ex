defmodule LiveViewDemoWeb.VolumesLive do
  use Phoenix.LiveView
  alias LiveViewDemoWeb.VolumesView
  alias LiveViewDemo.Gluster

  @topic inspect(__MODULE__)

  def render(assigns) do
    VolumesView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    Gluster.subscribe()
    {:ok, put_volumes_details(socket)}
  end

  def handle_info({Gluster, :cluster_changed}, socket) do
    {:noreply, put_volumes_details(socket)}
  end

  defp put_volumes_details(socket) do
    vols = Gluster.list_volumes()
    counts = Gluster.get_counts()
    assign(socket, volumes: vols, counts: counts)
  end
end
