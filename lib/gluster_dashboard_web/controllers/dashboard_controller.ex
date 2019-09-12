defmodule GlusterDashboardWeb.DashboardController do
  use GlusterDashboardWeb, :controller

  plug :put_layout, "dashboard.html"

  def volumes(conn, _params) do
    render(conn, "index.html", name: "volumes")
  end

  def volumes_detail(conn, %{"volname" => volname}) do
    render(conn, "index.html", name: "volumes-detail", volname: volname)
  end

  def peers(conn, _params) do
    render(conn, "index.html", name: "peers")
  end

  def bricks(conn, _params) do
    render(conn, "index.html", name: "bricks")
  end
end
