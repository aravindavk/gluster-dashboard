defmodule LiveViewDemo.Gluster.Brick do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bricks" do
    field :block_size, :integer
    field :device, :string
    field :fs, :string
    field :inodes_total, :integer
    field :inodes_used, :integer
    field :mount_options, :string
    field :path, :string
    field :pid, :integer
    field :port, :integer
    field :size_total, :integer
    field :size_used, :integer
    field :state, :string
    field :volume_id, :id
    field :subvol_id, :id
    field :peer_id, :id

    timestamps()
  end

  @doc false
  def changeset(brick, attrs) do
    brick
    |> cast(attrs, [:path, :state, :fs, :device, :mount_options, :block_size, :size_total, :size_used, :inodes_total, :inodes_used, :pid, :port])
    |> validate_required([:path, :state, :fs, :device, :mount_options, :block_size, :size_total, :size_used, :inodes_total, :inodes_used, :pid, :port])
  end
end
