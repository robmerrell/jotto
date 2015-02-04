defmodule Jotto.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  scope "/", Jotto do
    pipe_through :browser # Use the default browser stack
    get "/", GameController, :index
  end
end
