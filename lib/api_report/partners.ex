defmodule ApiReport.Partners do
  @moduledoc """
  The Partner context.
  """

  import Ecto.Query, warn: false

  alias ApiReport.ErrorHandling.Error
  alias ApiReport.Partners.Partner
  alias ApiReport.Repo

  def create_partner(attrs \\ %{}) do
    %Partner{}
    |> Partner.changeset(attrs)
    |> Repo.insert()
    |> handle_insert()
  end

  def list_partners do
    Repo.all(Partner)
  end

  def get_partner_by_id(id), do: Repo.get!(Partner, id)

  def get_partner(id) do
    with %Partner{} = partner <- Repo.get(Partner, id) do
      {:ok, partner}
    else
      nil -> {:error, Error.build_partner_not_found_error()}
    end
  end

  defp handle_insert({:ok, %Partner{}} = partner), do: partner

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
