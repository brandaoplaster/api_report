defmodule ApiReport.PartnersTest do
  use ApiReport.DataCase

  alias ApiReport.Partners.Partner
  alias ApiReport.Partners
  alias ApiReport.ErrorHandling.Error

  describe "partners" do
    test "create_partner/1 with valid data creates a partner" do
      expected = params_for(:partner, %{name: "John Wick"})
      assert {:ok, %Partner{} = partner} = Partners.create_partner(expected)
      assert partner.name == expected.name
    end

    test "create_partner/1 with invalid data returns error changeset" do
      expected = params_for(:partner, %{name: ""})
      assert {:error, %Error{}} = Partners.create_partner(expected)
    end

    test "list_partners/0 returns all partners" do
      partner = insert(:partner)
      assert Partners.list_partners() == [partner]
    end

    test "get_partner!/1 returns the partner with given id" do
      partner = insert(:partner)
      assert {:ok, %Partner{} = response} = Partners.get_partner(partner.id)
      assert partner.name == response.name
    end
  end
end
