defmodule QuantumBackend.Music.Show do
  alias QuantumBackend.{Repo, Music}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _uuid} -> get()
    end
  end

  def get() do
    case Repo.all(Music) do
      nil -> {:error, "Musics not found"}
      musics -> {:ok, Repo.preload(musics, :plan)}
    end
  end

end
