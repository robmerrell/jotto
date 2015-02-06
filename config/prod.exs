use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :jotto, Jotto.Endpoint,
  url: [host: "jotto.robdor.com"],
  http: [port: System.get_env("JOTTO_PORT") || 4100],
  secret_key_base: "2VNL7CM5Rxpnde6SunH/ouSJtZT7lZbdHP5YDonmHvj/yiC1d2Ss040H1L6L2odT",
  server: true

# Do not pring debug messages in production
config :logger, level: :info

config :jotto, Jotto.Repo, database: "jotto_production"

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :jotto, Jotto.Endpoint, server: true
#
