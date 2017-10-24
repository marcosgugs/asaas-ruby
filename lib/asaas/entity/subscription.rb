module Asaas
  module Entity
    class Subscription
      include Virtus.model

      attribute :id, String
      attribute :customer
      attribute :value, Float
      attribute :grossValue, Float
      attribute :nextDueDate, String
      attribute :cycle, String
      attribute :billingType, String
      attribute :description, String
      attribute :updatePendingPayments, Axiom::Types::Boolean
      attribute :payments, Array[Payment]
      attribute :creditCardHolderName, String
      attribute :creditCardNumber, String
      attribute :creditCardExpiryMonth, String
      attribute :creditCardExpiryYear, String
      attribute :creditCardCcv, String
      attribute :creditCardHolderFullName, String
      attribute :creditCardHolderEmail, String
      attribute :creditCardHolderCpfCnpj, String
      attribute :creditCardHolderAddress, String
      attribute :creditCardHolderAddressNumber, String
      attribute :creditCardHolderAddressComplement, String
      attribute :creditCardHolderProvince, String
      attribute :creditCardHolderCity, String
      attribute :creditCardHolderUf, String
      attribute :creditCardHolderPostalCode, String
      attribute :creditCardHolderPhone, String
      attribute :creditCardHolderPhoneDDD, String
      attribute :creditCardHolderMobilePhone, String
      attribute :creditCardHolderMobilePhoneDDD, String
      attribute :maxPayments, Integer
      attribute :endDate, String

    end
  end
end