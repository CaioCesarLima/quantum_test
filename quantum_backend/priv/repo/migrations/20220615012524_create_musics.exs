defmodule QuantumBackend.Repo.Migrations.CreateMusics do
  use Ecto.Migration

  def change do
    create table(:musics) do
      add :name, :string, null: false
      add :plan_id, references(:plans, on_delete: :delete_all), null: false
      timestamps()
    end

  end
end
