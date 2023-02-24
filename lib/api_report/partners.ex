defmodule ApiReport.Partners do
  @moduledoc """
  The Partner context.
  """

  import Ecto.Query, warn: false

  alias ApiReport.Repo
  alias ApiReport.Partners.Partner

  def create_partner(attrs \\ %{}) do
    %Partner{}
    |> Partner.changeset(attrs)
    |> Repo.insert()
  end

  def list_partners do
    Repo.all(Partner)
  end

  def get_partner!(id), do: Repo.get!(Partner, id)
end
