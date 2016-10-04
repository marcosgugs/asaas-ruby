module Asaas
  module Entity
    class Payment
      include Virtus.model

      attribute :id, Integer
      attribute :customer, String
      attribute :subscription, String
      attribute :billingType, String
      attribute :value, Float
      attribute :netValue, Float
      attribute :originalValue, Float
      attribute :interestValue, Float
      attribute :grossValue, Float
      attribute :dueDate, String
      attribute :status, String
      attribute :postalService, Axiom::Types::Boolean
      attribute :nossoNumero, String
      attribute :description, String
      attribute :invoiceNumber, String
      attribute :invoiceUrl, String
      attribute :boletoUrl, String
      attribute :installment, Integer
      attribute :installmentCount, Integer
      attribute :installmentValue, Float
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

    end
  end
end