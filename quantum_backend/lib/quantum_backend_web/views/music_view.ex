defmodule QuantumBackendWeb.MusicView do
  use QuantumBackendWeb, :view

  alias QuantumBackend.Music

  def render("fetch.json", %{musics: musics}) do
    %{
      music: Enum.map(musics, fn music -> %{name: music.name, plan: music.plan.name} end)
    }
  end
end
