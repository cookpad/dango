defmodule Dango.SessionController do
  use Dango.Web, :controller

  alias Dango.Session

  def new(conn, _params) do
    conn
    |> render(:new)
  end

  def create(conn, %{"session" => params}) do
    case Session.authenticate(params) do
      {:ok, user} ->
        path = get_session(conn, :redirect_url) || page_path(conn, :index)

        conn
        |> put_session(:current_user_id, user.id)
        |> redirect(to: path)
      :error ->
        conn
        |> put_flash(:error, gettext("Invalid username/password"))
        |> render(:new)
    end
  end

  def delete(conn, _params) do
    conn
    |> clear_session
    |> redirect(to: page_path(conn, :index))
  end
end
