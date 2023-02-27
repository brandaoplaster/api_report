defmodule ApiReportWeb.PartnersController do
  use ApiReportWeb, :controller

  alias ApiReport.Partners
  alias ApiReport.Partners.Partner
  alias ApiReportWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    with partners <- Partners.list_partners() do
      conn
      |> put_status(:ok)
      |> render("index.json", partners: partners)
    end
  end

  def create(conn, params) do
    with {:ok, %Partner{} = partner} <- Partners.create_partner(params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.partners_path(conn, :show, partner))
      |> render("create.json", partner: partner)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Partner{} = partner} <- Partners.get_partner(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", partner: partner)
    end
  end
end
