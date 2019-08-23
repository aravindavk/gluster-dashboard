defmodule LiveViewDemo.Gluster.Volume do
  use Ecto.Schema
  import Ecto.Changeset

  schema "volumes" do
    field :volid, :string
    field :arbiter_count, :integer
    field :disperse_count, :integer
    field :disperse_redundancy_count, :integer
    field :health, :string
    field :inodes_total, :integer
    field :inodes_used, :integer
    field :name, :string
    field :num_bricks, :integer
    field :num_subvols, :integer
    field :replica_count, :integer
    field :size_total, :integer
    field :size_used, :integer
    field :state, :string
    field :transport, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(volume, attrs) do
    volume
    |> cast(attrs, [:volid, :name, :type, :state, :health, :num_subvols, :num_bricks, :replica_count, :arbiter_count, :disperse_count, :disperse_redundancy_count, :transport, :size_total, :size_used, :inodes_total, :inodes_used])
    |> validate_required([:volid, :name, :type, :state, :health, :num_subvols, :num_bricks, :replica_count, :arbiter_count, :disperse_count, :disperse_redundancy_count, :transport, :size_total, :size_used, :inodes_total, :inodes_used])
  end
end
