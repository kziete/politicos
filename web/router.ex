defmodule Politicos.Router do
  use Politicos.Web, :router

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

  scope "/", Politicos do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end  

  scope "/admin", Politicos do
    pipe_through :browser # Use the default browser stack

    resources "/campana", CampanaController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Politicos do
  #   pipe_through :api
  # end
end
