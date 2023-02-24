defmodule ApiReport.Registrations.Registration do
  use Ecto.Schema

  import Ecto.Changeset

  alias ApiReport.Partners.Partner

  @fields ~w()a
  @required_fields ~w(name cpf email partner_id)a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "registrations" do
    field :name, :string
    field :cpf, :string
    field :email, :string
    belongs_to :partner, Partner

    timestamps()
  end

  def changeset(partner, attrs) do
    partner
    |> cast(attrs, @fields ++ @required_fields)
    |> validate_required(@required_fields)
  end
end
