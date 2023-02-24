defmodule ApiReport.Repo.Migrations.AddRegistrationsTable do
  use Ecto.Migration

  def change do
    create table(:registrations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :cpf, :string
      add :email, :string
      add :partner_id, references(:partners, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:registrations, [:partner_id])
  end
end
