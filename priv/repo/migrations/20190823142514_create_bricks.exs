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
      add :size_total, :integer
      add :size_used, :integer
      add :inodes_total, :integer
      add :inodes_used, :integer
      add :pid, :integer
      add :port, :integer
      add :volume_id, references(:volumes, on_delete: :nothing)
      add :subvol_id, references(:subvols, on_delete: :nothing)
      add :peer_id, references(:peers, on_delete: :nothing)

      timestamps()
    end

    create index(:bricks, [:volume_id])
    create index(:bricks, [:subvol_id])
    create index(:bricks, [:peer_id])
  end
end
