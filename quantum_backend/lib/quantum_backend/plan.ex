defmodule QuantumBackend.Plan do
  use Ecto.Schema
  import Ecto.Changeset

  alias QuantumBackend.Music

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "plans" do
    field :level, :integer
    field :limit, :integer
    field :name, :string
    has_many(:music, Music)
    timestamps()
  end

  def build(params) do
    params
    |> changeset(%QuantumBackend.Plan{})
    |> apply_action(:insert)
  end


  @doc false
  @required_field [:name, :limit, :level]
  def changeset(attrs, plan) do
    plan
    |> cast(attrs, @required_field)
    |> validate_required(@required_field)
  end
end
