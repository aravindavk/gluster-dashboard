defmodule GlusterDashboard.Repo.Migrations.CreateOptions do
  use Ecto.Migration

  def change do
    create table(:options) do
      add :name, :string
      add :value, :string
      add :volumes_id, references(:volumes, on_delete: :nothing, type: :string)

      timestamps()
    end

    create index(:options, [:volumes_id])
  end
end
