defmodule LiveViewDemo.Repo.Migrations.CreatePeers do
  use Ecto.Migration

  def change do
    create table(:peers, primary_key: false) do
      add :id, :string, primary_key: true
      add :address, :string
      add :state, :string

      timestamps()
    end

  end
end
