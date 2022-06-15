defmodule QuantumBackend.Repo.Migrations.CreateMusics do
  use Ecto.Migration

  def change do
    create table(:musics, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :trainer_id, references(:plans, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
