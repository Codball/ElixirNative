defmodule ElixirnativeWeb.Router do
  use ElixirnativeWeb, :router

  alias Elixirnative.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api/v1", ElixirnativeWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in

  end

  scope "/api/v1", ElixirnativeWeb do
    pipe_through [:api, :jwt_authenticated]

    get "my_user", UserController, :show

  end
end
