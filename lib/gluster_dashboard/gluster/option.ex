defmodule GlusterDashboard.Gluster.Option do
  use Ecto.Schema
  import Ecto.Changeset

  schema "options" do
    field :name, :string
    field :value, :string

    belongs_to :volumes, GlusterDashboard.Gluster.Volume, [type: :string, foreign_key: :volumes_id]

    timestamps()
  end

  @doc false
  def changeset(opton, attrs) do
    opton
    |> cast(attrs, [:name, :value, :volumes_id])
    |> validate_required([:name, :value, :volumes_id])
  end
end
