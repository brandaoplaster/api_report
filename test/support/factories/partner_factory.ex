defmodule ApiReport.PartnerFactory do
  defmacro __using__(_opts) do
    quote do
      def partner_factory do
        %ApiReport.Partners.Partner{
          id: Faker.UUID.v4(),
          name: Faker.Person.PtBr.name()
        }
      end
    end
  end
end
