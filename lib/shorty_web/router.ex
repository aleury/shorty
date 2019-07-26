defmodule ShortyWeb.Router do
  use ShortyWeb, :router

  pipeline :browser do
    plug :accepts, ["json"]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShortyWeb do
    pipe_through :browser

    get "/:shortcode", RedirectController, :show
  end

  scope "/api", ShortyWeb do
    pipe_through :api

    resources "/links", LinkController, except: [:new, :edit]
  end
end
