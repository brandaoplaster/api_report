defmodule ApiReport.PartnerFixture do
  alias ApiReport.Partners

  def valid_attrs, do: %{"name" => "John Wick"}

  def invalid_attrs, do: %{"name" => ""}

  def partner_fixture(attrs \\ %{}) do
    {:ok, partner} =
      attrs
      |> Enum.into(valid_attrs())
      |> Partners.create_partner()

      partner
  end
end
