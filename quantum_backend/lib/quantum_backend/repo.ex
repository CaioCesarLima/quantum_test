defmodule QuantumBackend.Repo do
  use Ecto.Repo,
    otp_app: :quantum_backend,
    adapter: Ecto.Adapters.Postgres
end
