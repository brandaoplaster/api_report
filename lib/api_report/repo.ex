defmodule ApiReport.Repo do
  use Ecto.Repo,
    otp_app: :api_report,
    adapter: Ecto.Adapters.Postgres
end
