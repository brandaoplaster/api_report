defmodule ApiReportWeb.CsvControllerTest do
  use ApiReportWeb.ConnCase, async: true

  describe "#create" do
    test "when all params are valid, creates a partner", %{conn: conn} do
      params = %{
        "start_date" => "2023-01-20",
        "end_date" => "2023-02-20",
        "report_name" => "DailyRegistrations"
      }

      response =
        conn
        |> post(Routes.csv_path(conn, :create, params["report_name"]), params)

      assert response.status == 200
    end
  end
end
