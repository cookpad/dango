defmodule Dango.Router do
  use Dango.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    if Mix.env == :test do
      plug Dango.SessionBackdoorPlug
    end
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Dango do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/sign_in", SessionController, :new, as: :sign_in
    delete "/sign_out", SessionController, :delete, as: :sign_out
    resources "/session", SessionController, only: [:create], singleton: true
  end
end
