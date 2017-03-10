defmodule Dango.PageController do
  use Dango.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
