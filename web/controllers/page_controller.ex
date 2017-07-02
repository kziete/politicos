defmodule Politicos.PageController do
  use Politicos.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
