defmodule LiveViewDemo.Gluster.Subvol do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
  schema "subvols" do
    field :arbiter_count, :integer
    field :disperse_count, :integer
    field :disperse_redundancy_count, :integer
    field :health, :string
    field :num_bricks, :integer
    field :replica_count, :integer
    field :type, :string

    belongs_to :volumes, LiveViewDemo.Gluster.Volume, [type: :string, foreign_key: :volumes_id]
    has_many :bricks, LiveViewDemo.Gluster.Brick, foreign_key: :subvols_id

    timestamps()
  end

  @doc false
  def changeset(subvol, attrs) do
    subvol
    |> cast(attrs, [:id, :health, :replica_count, :arbiter_count, :disperse_count, :disperse_redundancy_count, :type, :num_bricks, :volumes_id])
    |> validate_required([:id, :health, :replica_count, :arbiter_count, :disperse_count, :disperse_redundancy_count, :type, :num_bricks, :volumes_id])
  end
end
