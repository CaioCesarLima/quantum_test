defmodule QuantumBackend.Music.Show do
  import Ecto.Query

  alias QuantumBackend.{Repo, Music}


  def call(id) do
    case from(m in Music, where: m.plan_id == ^id) |>  Repo.all() do
      nil -> {:error, "Musics not found"}
      musics -> {:ok, Repo.preload(musics, :plan)}
    end
  end



end
