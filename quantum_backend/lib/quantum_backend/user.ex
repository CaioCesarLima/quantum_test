defmodule QuantumBackend.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias QuantumBackend.Plan

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :email, :string
    belongs_to(:plan, Plan)
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
