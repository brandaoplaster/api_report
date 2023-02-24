defmodule ApiReport.PartnersTest do
  use ApiReport.DataCase

  alias ApiReport.Partners.Partner
  alias ApiReport.Partners

  describe "partners" do
    test "create_partner/1 with valid data creates a partner" do
      expected = params_for(:partner, %{name: "John Wick"})
      assert {:ok, %Partner{} = partner} = Partners.create_partner(expected)
      assert partner.name == expected.name
    end

    test "create_partner/1 with invalid data returns error changeset" do
      expected = params_for(:partner, %{name: ""})
      assert {:error, %Ecto.Changeset{}} = Partners.create_partner(expected)
    end

    test "list_partners/0 returns all partners" do
      partner = insert(:partner)
      assert Partners.list_partners() == [partner]
    end

    test "get_partner!/1 returns the partner with given id" do
      partner = insert(:partner)
      assert Partners.get_partner!(partner.id) == partner
    end
  end
end
