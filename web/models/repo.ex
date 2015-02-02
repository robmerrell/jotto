defmodule Jotto.Repo do
  use Ecto.Repo,
    otp_app: :jotto,
    adapter: Ecto.Adapters.Postgres

  # def conf do
  #   parse_url "ecto://robmerrell:password@localhost/jotto_development"
  # end

  # def priv do
  #   app_dir(:hello_phoenix, "priv/repo")
  # end

end
