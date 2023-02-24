defmodule ApiReport.Factory do
  use ExMachina.Ecto, repo: ApiReport.Repo

  use ApiReport.RegistrationFactory
  use ApiReport.PartnerFactory
end
