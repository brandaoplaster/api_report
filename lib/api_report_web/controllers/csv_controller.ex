defmodule ApiReportWeb.CsvController do
  use ApiReportWeb, :controller

  alias ApiReportWeb.FallbackController
  alias ApiReport.Report.Report

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, csv} <- Report.generate_report(params) do
      send_download(conn, {:file, csv})
    end
  end
end
