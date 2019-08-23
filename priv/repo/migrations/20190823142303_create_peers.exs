defmodule LiveViewDemo.Repo.Migrations.CreatePeers do
  use Ecto.Migration

  def change do
    create table(:peers) do
      add :peerid, :string
      add :address, :string
      add :state, :string

      timestamps()
    end

  end
end
