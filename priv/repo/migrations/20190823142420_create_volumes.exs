defmodule LiveViewDemo.Repo.Migrations.CreateVolumes do
  use Ecto.Migration

  def change do
    create table(:volumes, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string
      add :type, :string
      add :state, :string
      add :health, :string
      add :num_subvols, :integer
      add :num_bricks, :integer
      add :replica_count, :integer
      add :arbiter_count, :integer
      add :disperse_count, :integer
      add :disperse_redundancy_count, :integer
      add :transport, :string
      add :size_total, :bigint
      add :size_used, :bigint
      add :inodes_total, :bigint
      add :inodes_used, :bigint

      timestamps()
    end

  end
end
