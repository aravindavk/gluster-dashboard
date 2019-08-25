defmodule LiveViewDemo.Gluster.Peer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
  schema "peers" do
    field :address, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(peer, attrs) do
    peer
    |> cast(attrs, [:id, :address, :state])
    |> validate_required([:id, :address, :state])
  end
end
