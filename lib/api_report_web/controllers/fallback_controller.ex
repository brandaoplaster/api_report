defmodule ApiReportWeb.FallbackController do
  use ApiReportWeb, :controller

  alias ApiReport.ErrorHandling.Error
  alias ApiReportWeb.ErrorView

  def call(conn, {:error, %Error{status: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end
end
