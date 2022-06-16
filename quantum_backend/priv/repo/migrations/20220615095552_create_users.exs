defmodule QuantumBackend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    create table(:users) do
      add :name, :string, null: false
      add :password_hash, :string, null: false
      add :email, :citext, null: false
      add :plan_id, references(:plans, on_delete: :delete_all), null: false
      timestamps()
    end

    create unique_index(:users, [:email])

    create table(:users_musics, primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all, primary_key: true)
      add :music_id, references(:musics, on_delete: :delete_all, primary_key: true)
    end

    create unique_index(:users_musics, [:user_id, :music_id])
  end
end
