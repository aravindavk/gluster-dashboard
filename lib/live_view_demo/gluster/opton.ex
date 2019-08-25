defmodule LiveViewDemo.Gluster.Opton do
  use Ecto.Schema
  import Ecto.Changeset

  schema "options" do
    field :name, :string
    field :value, :string
    field :volume_id, :string

    timestamps()
  end

  @doc false
  def changeset(opton, attrs) do
    opton
    |> cast(attrs, [:name, :value, :volume_id])
    |> validate_required([:name, :value, :volume_id])
  end
end
