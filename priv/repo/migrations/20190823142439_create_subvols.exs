defmodule LiveViewDemo.Repo.Migrations.CreateSubvols do
  use Ecto.Migration

  def change do
    create table(:subvols, primary_key: false) do
      add :id, :string, primary_key: true
      add :health, :string
      add :replica_count, :integer
      add :arbiter_count, :integer
      add :disperse_count, :integer
      add :disperse_redundancy_count, :integer
      add :type, :string
      add :num_bricks, :integer
      add :volumes_id, references(:volumes, on_delete: :nothing, type: :string)

      timestamps()
    end

    create index(:subvols, [:volumes_id])
  end
end
