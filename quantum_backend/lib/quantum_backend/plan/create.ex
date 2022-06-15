defmodule QuantumBackend.Plan.Create do
  alias QuantumBackend.{Repo, Plan}

  def call(params) do
    params
    |> Plan.build()
    |> create_plan()
  end

  defp create_plan({:ok, struct}), do: Repo.insert(struct)
  defp create_plan({:error, _struct} = error), do: error
end
