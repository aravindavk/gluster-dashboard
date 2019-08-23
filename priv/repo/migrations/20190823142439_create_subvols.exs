defmodule LiveViewDemo.Repo.Migrations.CreateSubvols do
  use Ecto.Migration

  def change do
    create table(:subvols) do
      add :name, :string
      add :health, :string
      add :replica_count, :integer
      add :arbiter_count, :integer
      add :disperse_count, :integer
      add :disperse_redundancy_count, :integer
      add :type, :string
      add :num_bricks, :integer
      add :volume_id, references(:volumes, on_delete: :nothing)

      timestamps()
    end

    create index(:subvols, [:volume_id])
  end
end
