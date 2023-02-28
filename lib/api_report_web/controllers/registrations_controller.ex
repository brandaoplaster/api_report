defmodule ApiReportWeb.RegistrationsController do
  use ApiReportWeb, :controller

  alias ApiReport.Registrations
  alias ApiReport.Registrations.Registration
  alias ApiReportWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Registration{} = registration} <- Registrations.create_registration(params) do
      conn
      |> put_status(:created)
      |> render("create.json", registration: registration)
    end
  end
end
