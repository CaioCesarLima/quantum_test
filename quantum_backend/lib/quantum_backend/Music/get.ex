defmodule QuantumBackend.Music.Get do

  import Ecto.UUID

  alias QuantumBackend.{Repo, Music}

  def call(id) do
    case Repo.get(Music, id) do
      nil -> {:error, "Music not found"}
      music -> {:ok, music |> Repo.preload([:plan, :users])}
    end
  end
end
