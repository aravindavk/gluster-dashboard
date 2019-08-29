defmodule LiveViewDemoWeb.VolumesLive do
  use Phoenix.LiveView
  alias LiveViewDemoWeb.VolumesView
  alias LiveViewDemo.Gluster

  @topic inspect(__MODULE__)

  def render(assigns) do
    VolumesView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, put_volumes_details(socket)}
  end

  defp put_volumes_details(socket) do
    assign(socket,
      volumes: Gluster.list_volumes(),
      counts: Gluster.get_counts())
  end
end
