defmodule QuantumBackendWeb.MusicView do
  use QuantumBackendWeb, :view

  alias QuantumBackend.Music

  def render("fetch.json", %{musics: musics}) do
    %{
      music: Enum.map(musics, fn music -> %{name: music.name, plan: music.plan.name} end)
    }
  end

  def render("music_add.json", params) do
    %{
      message: "Success",
      music: %{
        name: params.musics.name
      }
    }
  end

  def render("playlist.json", %{"musics" => musics}) do
    %{
      message: "Success",
      music: Enum.map(musics, fn music -> %{name: music.name, plan: music.plan.name} end)
    }
  end
end
