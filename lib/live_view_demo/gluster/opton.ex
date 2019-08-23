defmodule LiveViewDemo.Gluster.Opton do
  use Ecto.Schema
  import Ecto.Changeset

  schema "options" do
    field :name, :string
    field :value, :string
    field :volume_id, :id

    timestamps()
  end

  @doc false
  def changeset(opton, attrs) do
    opton
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
