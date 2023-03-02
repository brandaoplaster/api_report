defmodule ApiReport.PartnerFactory do
  alias Faker.Person.PtBr

  defmacro __using__(_opts) do
    quote do
      def partner_factory do
        %ApiReport.Partners.Partner{
          id: Faker.UUID.v4(),
          name: PtBr.name()
        }
      end
    end
  end
end
