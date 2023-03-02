defmodule ApiReport.Report.Csv do
  @tmp_dir "#{:code.priv_dir(:api_report)}/static"

  def build_daily_registrations(data) do
    csv_header = [:date, :name, :cpf, :email, :amount_of_records]
    file_name = generate_file_name()
    output_path = "#{@tmp_dir}/#{file_name}.csv"
    output_file = File.stream!(output_path, [:write])

    data
    |> CSV.encode(headers: csv_header, separator: ?;)
    |> Enum.into(output_file)
    |> Stream.run()

    {:ok, output_path}
  end

  def build_daily_registrations_by_partner(data) do
    csv_header = [:partner_name, :date, :name, :cpf, :email, :amount_of_records]
    file_name = generate_file_name()
    output_path = "#{@tmp_dir}/#{file_name}.csv"
    output_file = File.stream!(output_path, [:write])

    data
    |> CSV.encode(headers: csv_header, separator: ?;)
    |> Enum.into(output_file)
    |> Stream.run()

    {:ok, output_path}
  end

  defp generate_file_name() do
    datetime = DateTime.utc_now() |> DateTime.to_iso8601()

    Regex.replace(~r/[^0-9]/, datetime, "")
  end
end
