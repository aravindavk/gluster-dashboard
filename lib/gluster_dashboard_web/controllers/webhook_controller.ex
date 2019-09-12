defmodule GlusterDashboardWeb.WebhookController do
  use GlusterDashboardWeb, :controller
  alias GlusterDashboard.Gluster

  def create_or_update(conn, %{"peers" => peers, "volumes" => volumes}) do
    # TODO: Handle failure
    Gluster.delete_all()

    peers |> Enum.map(&Gluster.create_peer/1)

    for volume <- volumes do
      Gluster.create_volume(volume)

      for opt <- volume["options"] do
        Gluster.create_option(opt)
      end

      for subvol <- volume["subvols"] do
        Gluster.create_subvol(subvol)

        for brick <- subvol["bricks"] do
          IO.inspect Gluster.create_brick(brick)
        end
      end
    end

    Gluster.broadcast_change(:cluster_changed)
    json(conn, %{ok: true})
  end

end
