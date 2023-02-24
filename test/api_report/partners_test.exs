defmodule ApiReport.PartnersTest do
  use ApiReport.DataCase

  import ApiReport.PartnerFixture

  alias ApiReport.Partners.Partner
  alias ApiReport.Partners

  describe "partners" do
    test "create_partner/1 with valid data creates a partner" do
      params = valid_attrs()
      assert {:ok, %Partner{} = partner} = Partners.create_partner(params)
      assert partner.name == params["name"]
    end

    test "create_partner/1 with invalid data returns error changeset" do
      params = invalid_attrs()
      assert {:error, %Ecto.Changeset{}} = Partners.create_partner(params)
    end

    test "list_partners/0 returns all partners" do
      partner = partner_fixture()
      assert Partners.list_partners() == [partner]
    end

    test "get_partner!/1 returns the partner with given id" do
      partner = partner_fixture()
      assert Partners.get_partner!(partner.id) == partner
    end
  end
end
