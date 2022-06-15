defmodule QuantumBackend.Music do
  use Ecto.Schema
  import Ecto.Changeset

  alias QuantumBackend.Plan

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "musics" do
    field :name, :string
    belongs_to(:plan, Plan)
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
