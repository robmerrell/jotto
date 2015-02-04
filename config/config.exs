# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :jotto, Jotto.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2VNL7CM5Rxpnde6SunH/ouSJtZT7lZbdHP5YDonmHvj/yiC1d2Ss040H1L6L2odT",
  debug_errors: false,
  server: true

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :jotto, Jotto.Repo,
  username: System.get_env("JOTTO_DB_USERNAME") || "root",
  password: System.get_env("JOTTO_DB_PASSWORD") || "",
  hostname: System.get_env("JOTTO_DB_HOST") || "localhost"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
