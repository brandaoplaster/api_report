defmodule ApiReportWeb.PartnersControllerTest do
  use ApiReportWeb.ConnCase, async: true

  describe "#create" do
    test "when all params are valid, creates a partner", %{conn: conn} do
      params = %{
        name: "Mike"
      }

      response =
        conn
        |> post(Routes.partners_path(conn, :create), params)
        |> json_response(:created)

      assert %{
               "message" => "Partner created",
               "partner" => %{"id" => _, "name" => "Mike"}
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{description: "Banana"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.partners_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "#show" do
    test "when id exist, return partner", %{conn: conn} do
      %{id: partner_id} = insert(:partner, %{name: "Avell"})

      response =
        conn
        |> get(Routes.partners_path(conn, :show, partner_id))
        |> json_response(:ok)

      assert %{
               "message" => "Partner show",
               "partner" => %{
                 "id" => ^partner_id,
                 "name" => "Avell"
               }
             } = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id_does_not_exist = "594a146a-2ead-40cf-9f76-1e01fcfebdbe"

      response =
        conn
        |> get(Routes.partners_path(conn, :show, id_does_not_exist))
        |> json_response(:not_found)

      assert %{"message" => "Partner not found"} = response
    end
  end

  describe "#index" do
    test "when it has more than two partners it returns a list of partners", %{conn: conn} do
      insert(:partner, %{name: "Avell"})
      insert(:partner, %{name: "Avell 2"})

      response =
        conn
        |> get(Routes.partners_path(conn, :index))
        |> json_response(:ok)

      assert %{
               "message" => "Partner listing",
               "partner" => [
                 %{"id" => _, "name" => "Avell"},
                 %{"id" => _, "name" => "Avell 2"}
               ]
             } = response
    end
  end
end
