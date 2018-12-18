defmodule Elixirnative.Repo do
  use Ecto.Repo,
    otp_app: :elixirnative,
    adapter: Ecto.Adapters.Postgres
end
