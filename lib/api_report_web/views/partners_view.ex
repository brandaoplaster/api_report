defmodule ApiReportWeb.PartnersView do
  use ApiReportWeb, :view

  alias ApiReport.Partners.Partner

  def render("index.json", %{partners:  partners}) do
    %{
      partner: Enum.map(partners, &partners_json/1),
      message: "Partner listing"
    }
  end

  def render("create.json", %{partner: %Partner{} = partner}) do
    %{
      partner: %{
        id: partner.id,
        name: partner.name
      },
      message: "Partner created"
    }
  end

  def render("show.json", %{partner: %Partner{} = partner}) do
    %{
      partner: %{
        id: partner.id,
        name: partner.name
      },
      message: "Partner show"
    }
  end

  defp partners_json(partner) do
    %{
      id: partner.id,
      name: partner.name
    }
  end
end
