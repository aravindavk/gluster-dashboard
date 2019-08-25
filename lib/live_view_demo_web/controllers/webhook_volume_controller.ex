defmodule LiveViewDemoWeb.WebhookVolumeController do
  use LiveViewDemoWeb, :controller
  alias LiveViewDemo.Gluster

  def create_or_update(conn, %{"volumes" => volumes}) do
    # TODO: Delete volumes, subvols, options and bricks tables to handle deleted volumes
    # TODO: Handle failure
    for volume <- volumes do
      Gluster.create_or_update_volume(volume)

      for opt <- volume["options"] do
        Gluster.create_or_update_option(opt)
      end

      for subvol <- volume["subvols"] do
        Gluster.create_or_update_subvol(subvol)

        for brick <- subvol["bricks"] do
          Gluster.create_or_update_brick(brick)
        end

      end

    end

    json(conn, %{ok: true})
  end

end
