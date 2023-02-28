defmodule ApiReportWeb.RegistrationsView do
  use ApiReportWeb, :view

  alias ApiReport.Registrations.Registration

  def render("create.json", %{registration: %Registration{} = registration}) do
    %{
      registration: %{
        id: registration.id,
        name: registration.name,
        email: registration.email,
        cpf: registration.cpf,
        partner_id: registration.partner_id
      },
      message: "Registration created"
    }
  end
end
