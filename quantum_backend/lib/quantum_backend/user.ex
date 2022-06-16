defmodule QuantumBackend.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias QuantumBackend.Plan
  alias QuantumBackend.Music


  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :email, :string
    belongs_to(:plan, Plan)
    many_to_many :musics, Music, join_through: "users_musics", join_keys: [user_id: :id, music_id: :id]
    timestamps()
  end

  def build(params) do
    params
    |> changeset(%QuantumBackend.User{})
    |> apply_action(:insert)
  end

  @doc false
  @required_params [:name, :email, :password_hash, :plan_id]
  def changeset(attrs, user) do
    user
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
