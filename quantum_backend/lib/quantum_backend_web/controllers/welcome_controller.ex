defmodule QuantumBackendWeb.WelcomeController do
  use QuantumBackendWeb, :controller

  def index(conn, _params) do
    json(conn, %{id: "Olá"})
  end
end
