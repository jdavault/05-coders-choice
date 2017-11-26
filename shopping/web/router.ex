defmodule Shopping.Router do
  use Shopping.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Shopping do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/products", ProductController
    resources "/carts", CartController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Shopping do
  #   pipe_through :api
  # end
end
