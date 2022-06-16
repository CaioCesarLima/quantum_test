defmodule QuantumBackendWeb.UserView do
  use QuantumBackendWeb, :view

  QuantumBackend.User

  def render("create.json", %{user: user}, token: token) do
    %{
      message: "User created",
      user: %{
        id: user.id,
        name: user.name,
        email: user.email
      },
      token: token
    }
  end

  def render("sign_in.json", %{token: token}) do
    %{
      message: "User Logged",
      token: token
    }
  end

end
