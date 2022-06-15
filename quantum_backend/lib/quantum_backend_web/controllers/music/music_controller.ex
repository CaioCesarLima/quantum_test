defmodule QuantumBackendWeb.MusicController do
  use QuantumBackendWeb, :controller


  def show(conn, %{"id" => id}) do
    id
    |> QuantumBackend.fetch_musics()
    |> hendle_response(conn)
  end

  def hendle_response({:ok, musics}, conn) do
    conn
    |> put_status(:ok)
    |> render("fetch.json", musics: musics)
  end
end
