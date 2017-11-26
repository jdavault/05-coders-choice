defmodule Shopping.PageController do
  use Shopping.Web, :controller

  def index(conn, params) do
    
    visit = get_session(conn, "counter") || 0
    visit = visit + 1
    conn 
    |> IO.inspect
    |> put_session("counter", visit)
    |> render("index.html", 
                name: params["name"],
                visit: visit)
  end

end
