defmodule ApiReport.Partners.Partner do
  use Ecto.Schema

  import Ecto.Changeset

  alias ApiReport.Registrations.Registration

  @fields ~w()a
  @required_fields ~w(name)a

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "partners" do
    field :name, :string

    has_many :registrations, Registration

    timestamps()
  end

  def changeset(partner, attrs) do
    partner
    |> cast(attrs, @fields ++ @required_fields)
    |> validate_required(@required_fields)
  end
end
