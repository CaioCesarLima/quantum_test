defmodule QuantumBackendWeb.FallbackController do
  use QuantumBackendWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(QuantumBackendWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
