defmodule QuantumBackend.Playlist.Delete do
  import Ecto.Query


  alias QuantumBackend.{Repo, Music, User}

  def call(%{"user_id" => user_id, "music_id" => music_id}) do
    user = User.Get.call(user_id)
    |> IO.inspect(label: "Usuario")

    music = Music.Get.call(music_id)
    |> IO.inspect(label: "Musica")
    is_valid(user, music)
    # |> Repo.update!()
    # |> IO.inspect(label: "changeset")
  end

  defp is_valid({:error, message} = _user, _music) do
    {:error, message}
  end

  defp is_valid(_user, {:error, message} = _music) do
    {:error, message}
  end

  defp is_valid(user , {:ok, music = music}) do

    case Repo.delete_all(query_user_music(user.id, music.id)) do
      {1, nil} ->
        {:ok, "successfully removed"}
      {0, nil} ->
        {:ok, "não encontrado"}
    end
    # query = from u in "users_musics", where: u.user_id == ^user.id and u.music_id == ^music.id, select: [u.id, u.user_id, u.music_id]
    # Repo.delete_all(query)
    # {:ok, "deleted"}
  end

  defp query_user_music(user_id, music_id) do
    IO.inspect(user_id)
    from(p in "users_musics",
    where: p.user_id == ^user_id,
    where: p.music_id == ^music_id
  )
  end
end
