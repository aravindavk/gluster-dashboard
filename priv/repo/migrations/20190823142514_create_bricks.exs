defmodule LiveViewDemo.Repo.Migrations.CreateBricks do
  use Ecto.Migration

  def change do
    create table(:bricks) do
      add :path, :string
      add :state, :string
      add :fs, :string
      add :device, :string
      add :mount_options, :string
      add :block_size, :integer
      add :size_total, :bigint
      add :size_used, :bigint
      add :inodes_total, :bigint
      add :inodes_used, :bigint
      add :pid, :integer
      add :port, :integer
      add :volumes_id, references(:volumes, on_delete: :nothing, type: :string)
      add :subvols_id, references(:subvols, on_delete: :nothing, type: :string)
      add :peers_id, references(:peers, on_delete: :nothing, type: :string)

      timestamps()
    end

    create index(:bricks, [:volumes_id])
    create index(:bricks, [:subvols_id])
    create index(:bricks, [:peers_id])
  end
end
