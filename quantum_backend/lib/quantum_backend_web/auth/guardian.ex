defmodule QuantumBackendWeb.Auth.Guardian do
  use Guardian, otp_app: :quantum_backend

  alias QuantumBackend.{Repo, User}
  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> QuantumBackend.fetch_user()
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    case Repo.get(User, user_id) do
      nil -> {:error, "User not found"}
      user -> validate_password(user, password)
    end
  end

  def validate_password(%User{password_hash: hash} = user, password) do
    case hash == password do
      true -> create_token(user)
      false -> {:error, :unauthorized}
    end
  end

  def create_token(user) do
    case encode_and_sign(user) do
      {:ok, token, _claims} -> {:ok, token}
      {:error, :secret_not_found} -> {:error, :secret_not_found}
    end

  end
end
