use Mix.Config

config :jotto, Jotto.Endpoint,
  http: [port: System.get_env("PORT") || 4001]

config :jotto, Jotto.Repo, database: "jotto_test"

# Print only warnings and errors during test
config :logger, level: :warn
