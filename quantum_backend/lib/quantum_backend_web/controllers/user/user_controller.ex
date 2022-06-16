defmodule QuantumBackendWeb.UserController do
  use QuantumBackendWeb, :controller

  alias QuantumBackendWeb.Auth.Guardian

  action_fallback QuantumBackendWeb.FallbackController

  def create(conn, params) do
    IO.inspect(params, label: "params")
    with {:ok, user} <- QuantumBackend.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
          Io.inspect(user, label: "user")

          conn
          |> put_status(:created)
          |> render("create.json", %{user: user, token: token})
         end
  end

  def sign_in(conn, params) do
    with {:ok, token} = Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
