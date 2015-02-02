defmodule Jotto.Endpoint do
  use Phoenix.Endpoint, otp_app: :jotto

  plug Plug.Static,
    at: "/", from: :jotto

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_jotto_key",
    signing_salt: "5c+S7J7X",
    encryption_salt: "R5+tAl2y"

  plug :router, Jotto.Router
end
