defmodule ApiReport.RegistrationsTest do
  use ApiReport.DataCase

  import ApiReport.Factory

  alias ApiReport.Registrations.Registration
  alias ApiReport.Registrations

  describe "registration" do
    test "create_registration/1 with valid data creates a registration" do
      partner = insert(:partner)

      expected = %{
        "cpf" => "111.222.333-42",
        "email" => "ruan@gmail.com",
        "name" => "Ruan Chaves",
        "partner_id" => partner.id
      }

      assert {:ok, %Registration{} = registration} = Registrations.create_registration(expected)
      assert registration.email == expected["email"]
    end

    test "create_registration/1 with invalid data returns error changeset" do
      partner = insert(:partner)

      expected = %{
        "email" => "",
        "partner_id" => partner.id
      }

      assert {:error, %Ecto.Changeset{}} = Registrations.create_registration(expected)
    end

    test "create_registration/1 without partner_id returns error MatchError" do
      expected = params_for(:registration, %{email: ""})

      assert_raise MatchError, fn ->
        Registrations.create_registration(expected)
      end
    end
  end
end
