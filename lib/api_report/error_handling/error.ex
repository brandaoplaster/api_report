defmodule ApiReport.ErrorHandling.Error do
  @key [:status, :message]

  @enforce_keys @key

  defstruct @key

  def build(status, message) do
    %__MODULE__{
      status: status,
      message: message
    }
  end

  def build_partner_not_found_error, do: build(:not_found, "Partner not found")

  def build_report_not_found_error, do: build(:not_found, "Report name not found")

  def build_invalid_filter_error, do: build(:not_found, "Error sent filters are not valid!")
end
