defmodule GlusterDashboard.Gluster.Volume do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
  schema "volumes" do
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

    has_many :subvols, GlusterDashboard.Gluster.Subvol, foreign_key: :volumes_id
    has_many :bricks, GlusterDashboard.Gluster.Brick, foreign_key: :volumes_id
    has_many :options, GlusterDashboard.Gluster.Option, foreign_key: :volumes_id

    timestamps()
  end

  @doc false
  def changeset(volume, attrs) do
    volume
    |> cast(attrs, [:id, :name, :type, :state, :health, :num_subvols, :num_bricks, :replica_count, :arbiter_count, :disperse_count, :disperse_redundancy_count, :transport, :size_total, :size_used, :inodes_total, :inodes_used])
    |> validate_required([:id, :name, :type, :state, :health, :num_subvols, :num_bricks, :replica_count, :arbiter_count, :disperse_count, :disperse_redundancy_count, :transport, :size_total, :size_used, :inodes_total, :inodes_used])
  end
end
