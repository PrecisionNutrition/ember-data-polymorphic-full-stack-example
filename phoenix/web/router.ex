defmodule EmberPaint.Router do
  use EmberPaint.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EmberPaint do
    pipe_through :api
    resources "/drawings", DrawingController
    resources "/shapes", ShapeController
    resources "/rectangles", ShapeController
    resources "/triangles", ShapeController
  end
end
