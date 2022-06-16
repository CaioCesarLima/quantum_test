defmodule QuantumBackend.Playlist.Add do
  import Ecto.UUID

  alias QuantumBackend.{Repo, Music, User}

  def call(%{"user_id" => user_id, "music_id" => music_id}) do


   user = User.Get.call(user_id)

    music = case Music.Get.call(music_id) do
      {:ok, struct} -> Ecto.Changeset.change(struct)
      {:error, message} -> {:error, message}
    end
    IO.inspect(music, label: "music")
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

  defp is_valid(user, music) do
    music = music
    |> Ecto.Changeset.put_assoc(:users, [user])
    |> Repo.update!()
    |> IO.inspect(label: "put assoc")
    {:ok, music}
  end




end
