defmodule LiveViewDemo.Gluster.Subvol do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subvols" do
    field :name, :string
    field :arbiter_count, :integer
    field :disperse_count, :integer
    field :disperse_redundancy_count, :integer
    field :health, :string
    field :num_bricks, :integer
    field :replica_count, :integer
    field :type, :string
    field :volume_id, :id

    timestamps()
  end

  @doc false
  def changeset(subvol, attrs) do
    subvol
    |> cast(attrs, [:name, :health, :replica_count, :arbiter_count, :disperse_count, :disperse_redundancy_count, :type, :num_bricks])
    |> validate_required([:name, :health, :replica_count, :arbiter_count, :disperse_count, :disperse_redundancy_count, :type, :num_bricks])
  end
end
