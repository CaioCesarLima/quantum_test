defmodule QuantumBackend.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans, primary_key: false) do
      add :id, :uuid, primakey_key: true
      add :name, :string
      add :limit, :integer
      add :level, :integer

      timestamps()
    end

    create unique_index(:plans, [:id])
  end
end
