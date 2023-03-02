defmodule ApiReport.RegistrationFactory do
  alias Faker.Person.PtBr

  defmacro __using__(_opts) do
    quote do
      def registration_factory do
        %ApiReport.Registrations.Registration{
          id: Faker.UUID.v4(),
          name: PtBr.name(),
          cpf: "111.222.333-4#{Enum.random(1..10)}",
          email: Faker.Internet.free_email(),
          partner: build(:partner)
        }
      end
    end
  end
end
