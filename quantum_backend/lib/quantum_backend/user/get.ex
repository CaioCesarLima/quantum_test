defmodule QuantumBackend.User.Get do
  import Ecto.UUID

  alias QuantumBackend.{Repo, User}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user ->  user |> Repo.preload([:plan, :musics])
    end
  end
end
