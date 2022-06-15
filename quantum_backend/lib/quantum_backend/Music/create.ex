defmodule QuantumBackend.Music.Create do
  alias QuantumBackend.{Repo, Music}

  def call(params) do
    params
    |> Music.build()
    |> create_music()
  end

  defp create_music({:ok, struct}), do: Repo.insert(struct)
  defp create_music({:error, _struct} = error), do: error
end
