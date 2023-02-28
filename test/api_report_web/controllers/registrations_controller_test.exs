defmodule ApiReportWeb.RegistrationsControllerTest do
  use ApiReportWeb.ConnCase, async: true

  describe "#create" do
    test "when all params are valid, creates a registration", %{conn: conn} do
      partner = insert(:partner)
      params = params_for(:registration, %{partner_id: partner.id})

      response =
        conn
        |> post(Routes.registrations_path(conn, :create), params)
        |> json_response(:created)

      assert %{"registration" => expected} = response
      assert expected["name"] == params.name
      assert expected["partner_id"] == partner.id
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = params_for(:registration)

      assert_raise MatchError, fn ->
        conn
        |> post(Routes.registrations_path(conn, :create, params))
        |> json_response(:created)
      end
    end
  end
end
