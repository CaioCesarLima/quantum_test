defmodule QuantumBackend.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :name, :string
      add :limit, :integer
      add :level, :integer

      timestamps()
    end

    create unique_index(:plans, [:id])
  end
end
