defmodule EmberPaint.Endpoint do
  use Phoenix.Endpoint, otp_app: :ember_paint

  socket "/ws", EmberPaint.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :ember_paint, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_ember_paint_key",
    signing_salt: "mOx4P5iT"

  plug Corsica, [origins: ["http://localhost:4210"], allow_headers: ["accept", "content-type"]]
  plug EmberPaint.Router
end
