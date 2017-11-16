defmodule Store.Web.PageController do
  use Store.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
