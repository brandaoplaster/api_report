defmodule ApiReport.Report.ReportTest do
  use ApiReport.DataCase

  alias ApiReport.ErrorHandling.Error
  alias ApiReport.Report.Report

  describe "generate_report/1" do
    test "when report_name is invalid return error" do
      params = %{"report_name" => "report"}
      assert {:error, %Error{} = error} = Report.generate_report(params)
      assert error.status == :not_found
    end

    test "when the filter is invalid return error" do
      params = %{
        "start_date" => "2023-01-20",
        "report_name" => "DailyRegistrations"
      }

      assert {:error, %Error{} = error} = Report.generate_report(params)
      assert error.message == "Error sent filters are not valid!"
      assert error.status == :not_found
    end

    test "when the DailyRegistrationsByPartner report is valid it returns {:ok, path}" do
      params = %{
        "start_date" => "2023-01-20",
        "end_date" => "2023-02-20",
        "report_name" => "DailyRegistrationsByPartner"
      }

      assert {:ok, _} = Report.generate_report(params)
    end

    test "when the DailyRegistrationsByPartner report is invalid it returns error" do
      params = %{
        "end_date" => "2023-02-20",
        "report_name" => "DailyRegistrationsByPartner"
      }

      assert {:error, %Error{} = error} = Report.generate_report(params)
      assert error.message == "Error sent filters are not valid!"
      assert error.status == :not_found
    end

    test "when the DailyRegistrations report is valid it returns {:ok, path}" do
      params = %{
        "start_date" => "2023-01-20",
        "end_date" => "2023-02-20",
        "report_name" => "DailyRegistrations"
      }

      assert {:ok, _} = Report.generate_report(params)
    end
  end
end
