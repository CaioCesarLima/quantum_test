defmodule QuantumBackend.Playlist.Get do
  import Ecto.Query


  alias QuantumBackend.{Repo, Music, User}

  def call(%{"id" => id}) do
    case Repo.get(User, id) |> Repo.preload([:musics]) do
      nil -> {:error, "Playlist not found"}
      user -> {:ok, user}
    end
  end

end
