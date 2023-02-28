defmodule ApiReport.Registrations do
  @moduledoc """
  The Registration context.
  """

  import Ecto.Query, warn: false

  alias ApiReport.{Partners, Registrations, Repo}
  alias ApiReport.Registrations.Registration

  def create_registration(attrs \\ %{}) do
    %{"partner_id" => partner_id} = attrs

    partner_id
    |> Partners.get_partner_by_id()
    |> Ecto.build_assoc(:registrations)
    |> Registration.changeset(attrs)
    |> Repo.insert()
  end
end
