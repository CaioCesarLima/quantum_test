defmodule QuantumBackend.User.Create do
  alias QuantumBackend.{Repo, User}

  def call(params) do
    params
    |> User.build()
    |> create_user()
  end

  defp create_user({:ok, struct}), do: Repo.insert(struct)
  defp create_user({:error, _struct} = error), do: error
end
