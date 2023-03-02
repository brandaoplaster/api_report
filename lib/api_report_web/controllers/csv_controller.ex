defmodule ApiReportWeb.CsvController do
  use ApiReportWeb, :controller

  alias ApiReport.Report.Report
  alias ApiReportWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, csv} <- Report.generate_report(params) do
      send_download(conn, {:file, csv})
    end
  end
end
