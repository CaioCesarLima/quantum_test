defmodule QuantumBackend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :password_hash, :string, null: false
      add :email, :citext, null: false
      add :plan_id, references(:plans, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end

    create unique_index(:users, [:email])

    create table(:users_musics, primary_key: false) do
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all)
      add :music_id, references(:musics, type: :uuid, on_delete: :delete_all)
    end
  end
end
