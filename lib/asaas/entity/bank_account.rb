module Asaas
  module Entity
    class BankAccount
      include Virtus.model

      attribute :ownerName, String
      attribute :cpfCnpj, String
      attribute :bank, String
      attribute :agency, String
      attribute :agencyDigit, String
      attribute :account, String
      attribute :accountDigit, String
      attribute :bankAccounttype, String
    end
  end
end