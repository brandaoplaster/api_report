defmodule ApiReport.Report.Report do
  alias ApiReport.ErrorHandling.Error
  alias ApiReport.Registrations
  alias ApiReport.Report.Csv

  def generate_report(%{"report_name" => "DailyRegistrations"} = params) do
    case validate_filters(params) do
      {:ok, params} ->
        daily_registrations(params)

      {:error, _} ->
        {:error, Error.build_invalid_filter_error()}
    end
  end

  def generate_report(%{"report_name" => "DailyRegistrationsByPartner"} = params) do
    case validate_filters(params) do
      {:ok, params} ->
        daily_registrations_by_partner(params)

      {:error, _} ->
        {:error, Error.build_invalid_filter_error()}
    end
  end

  def generate_report(%{"report_name" => _} = _params) do
    {:error, Error.build_report_not_found_error()}
  end

  defp daily_registrations(params) do
    params
    |> Registrations.daily_registrations()
    |> Csv.build_daily_registrations()
  end

  defp daily_registrations_by_partner(params) do
    params
    |> Registrations.daily_registrations_by_partner()
    |> Csv.build_daily_registrations_by_partner()
  end

  defp validate_filters(params) do
    case Map.has_key?(params, "start_date") and Map.has_key?(params, "end_date") do
      true ->
        {:ok, params}

      false ->
        {:error, "invalid filter"}
    end
  end
end
