defmodule ApiReport.Registrations do
  @moduledoc """
  The Registration context.
  """

  import Ecto.Query, warn: false

  alias ApiReport.{Partners, Registrations, Repo}
  alias ApiReport.Partners.Partner
  alias ApiReport.Registrations.Registration

  defmacro dates_between(field, initial, final) do
    quote do:
            fragment(
              "? BETWEEN ? AND ?",
              unquote(field),
              type(unquote(initial), :date),
              type(unquote(final), :date)
            )
  end

  defmacro date_trunc(field) do
    quote do: fragment("DATE_TRUNC('DAY', ?)", unquote(field))
  end

  defmacro format_date(field) do
    quote do: fragment("TO_CHAR(?, 'DD/MM/YYYY')", unquote(field))
  end

  def create_registration(attrs \\ %{}) do
    %{"partner_id" => partner_id} = attrs

    partner_id
    |> Partners.get_partner_by_id()
    |> Ecto.build_assoc(:registrations)
    |> Registration.changeset(attrs)
    |> Repo.insert()
  end

  def daily_registrations(%{"start_date" => start_date, "end_date" => end_date}) do
    Registration
    |> join(:inner, [r], p in Partner, on: r.partner_id == p.id)
    |> where([r, p], dates_between(date_trunc(r.inserted_at), ^start_date, ^end_date))
    |> group_by([r, p], [format_date(r.inserted_at), r.name, r.cpf, r.email])
    |> select([r, p], %{
      date: format_date(r.inserted_at),
      name: r.name,
      cpf: r.cpf,
      email: r.email,
      amount_of_records: count("*")
    })
    |> Repo.all()
  end

  def daily_registrations_by_partner(%{"start_date" => start_date, "end_date" => end_date}) do
    Registration
    |> join(:inner, [r], p in Partner, on: r.partner_id == p.id)
    |> where([r, p], dates_between(date_trunc(r.inserted_at), ^start_date, ^end_date))
    |> group_by([r, p], [p.name, format_date(r.inserted_at), r.name, r.cpf, r.email])
    |> select([r, p], %{
      partner_name: p.name,
      date: format_date(r.inserted_at),
      name: r.name,
      cpf: r.cpf,
      email: r.email,
      amount_of_records: count("*")
    })
    |> Repo.all()
  end
end
