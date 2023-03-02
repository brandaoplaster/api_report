defmodule ApiReport.Report.CsvTest do
  use ApiReport.DataCase

  alias ApiReport.Report.Csv

  describe "csv" do
    test "build_daily_registrations/1 creates a csv file with the data and returns {:ok, path}" do
      params = [
        %{
          amount_of_records: 1,
          cpf: "111.222.333.54",
          date: "28/02/2023",
          email: "lucas@gmail.com",
          name: "Bruna"
        },
        %{
          amount_of_records: 1,
          cpf: "111.222.333.54",
          date: "28/02/2023",
          email: "lucas@gmail.com",
          name: "Lucas"
        }
      ]

      assert {:ok, _csv} = Csv.build_daily_registrations(params)
    end

    test "build_daily_registrations_by_partner/1 creates a csv file with the data and returns {:ok, path}" do
      params = [
        %{
          amount_of_records: 1,
          cpf: "111.222.333.54",
          date: "28/02/2023",
          email: "lucas@gmail.com",
          name: "Bruna",
          partner_name: "Bruna"
        },
        %{
          amount_of_records: 1,
          cpf: "111.222.333.54",
          date: "28/02/2023",
          email: "lucas@gmail.com",
          name: "Lucas",
          partner_name: "Lucas"
        }
      ]

      assert {:ok, _csv} = Csv.build_daily_registrations_by_partner(params)
    end
  end
end
