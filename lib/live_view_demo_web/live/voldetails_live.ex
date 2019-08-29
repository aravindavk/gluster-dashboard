defmodule LiveViewDemoWeb.VoldetailsLive do
  use Phoenix.LiveView
  alias LiveViewDemoWeb.VoldetailsView
  alias LiveViewDemo.Gluster

  @topic inspect(__MODULE__)

  def render(assigns) do
    VoldetailsView.render("index.html", assigns)
  end

  def mount(%{volname: volname}, socket) do
    socket = assign(socket, volname: volname)
    {:ok, put_volumes_details(socket)}
  end

  defp put_volumes_details(socket) do
    assign(socket, volume: Gluster.get_volume_by_name(socket.assigns.volname), counts: Gluster.get_counts())
  end
end
