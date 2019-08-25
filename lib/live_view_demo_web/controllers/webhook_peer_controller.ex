defmodule LiveViewDemoWeb.WebhookPeerController do
  use LiveViewDemoWeb, :controller
  alias LiveViewDemo.Gluster

  def create_or_update(conn, %{"peers" => peers}) do
    # TODO: Delete peers table to handle deleted peers
    # TODO: Handle failure
    peers
    |> Enum.map(&Gluster.create_or_update_peer/1)

    json(conn, %{ok: true})
  end
end
