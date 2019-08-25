defmodule LiveViewDemo.Repo.Migrations.CreateOptions do
  use Ecto.Migration

  def change do
    create table(:options) do
      add :name, :string
      add :value, :string
      add :volume_id, references(:volumes, on_delete: :nothing, type: :string)

      timestamps()
    end

    create index(:options, [:volume_id])
  end
end
