defmodule Dango.SessionBackdoorPlug do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    case conn.query_params do
      %{"as" => user_id} ->
        conn
        |> put_session(:current_user_id, user_id)
      _ -> conn
    end
  end
end
