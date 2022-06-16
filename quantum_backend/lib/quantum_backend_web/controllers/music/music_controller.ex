defmodule QuantumBackendWeb.MusicController do
  use QuantumBackendWeb, :controller

  action_fallback QuantumBackendWeb.FallbackController

  def show(conn, %{"id" => id}) do
    id
    |> QuantumBackend.fetch_musics()
    |> handle_response(conn, "fetch.json")
  end

  def delete(conn, params) do
    params
    |> QuantumBackend.remove_music_playlist()
    |> handle_response_delete(conn)
  end

  def get_playlist(conn, params) do
    params
    |> QuantumBackend.get_playlist()
    |> IO.inspect(label: "retorno")
    |> handle_response(conn, "playlist.json")
  end

  def create(conn, params) do
    params
    |> QuantumBackend.add_music_playlist()
    |> handle_response_playlist(conn)
  end


  def handle_response_playlist({:ok, music_add }, conn) do
    conn
    |> put_status(:ok)
    |> render("music_add.json", musics: music_add)
  end

  def handle_response_playlist({:error, _changeset} = error, _conn), do: error

  def handle_response({:ok, musics}, conn, view) do
    IO.inspect(musics)
    conn
    |> put_status(:ok)
    |> render(view, musics: musics)
  end

  def handle_response({:erro, _changeset} = error, _conn, _view), do: error

  def handle_response_delete({:ok, message}, conn) do
    conn
    |> put_status(:ok)
    |> text(message)
  end
  def handle_response_delete({:erro, _changeset} = error, _conn), do: error
end
