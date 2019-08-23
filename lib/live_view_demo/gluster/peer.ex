defmodule LiveViewDemo.Gluster.Peer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "peers" do
    field :peerid, :string
    field :address, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(peer, attrs) do
    peer
    |> cast(attrs, [:peerid, :address, :state])
    |> validate_required([:peerid, :address, :state])
  end
end
