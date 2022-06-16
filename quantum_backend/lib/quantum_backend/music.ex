defmodule QuantumBackend.Music do
  use Ecto.Schema
  import Ecto.Changeset

  alias QuantumBackend.{Plan, User}


  schema "musics" do
    field :name, :string
    belongs_to(:plan, Plan)
    many_to_many :users, User, join_through: "users_musics"
    timestamps()
  end

  def build(params) do
    params
    |> changeset(%QuantumBackend.Music{})
    |> apply_action(:insert)
  end

  @doc false
  @required_params [:name, :plan_id]
  def changeset(attrs, music) do
    music
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
