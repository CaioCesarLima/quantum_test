defmodule QuantumBackendWeb.PageController do
  use QuantumBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
