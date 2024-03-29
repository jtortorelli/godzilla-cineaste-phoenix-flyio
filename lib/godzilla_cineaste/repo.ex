defmodule GodzillaCineaste.Repo do
  use Ecto.Repo,
    otp_app: :godzilla_cineaste,
    adapter: Ecto.Adapters.Postgres
end
