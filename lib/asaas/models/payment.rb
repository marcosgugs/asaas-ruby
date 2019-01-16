module Asaas
  class Payment < Model
    BillingTypes = Types::Strict::String.enum('BOLETO', 'CREDIT_CARD', 'UNDEFINED')

    attribute :id, Types::Coercible::String.optional.default(nil)
    attribute :customer, Types::Coercible::String
    attribute :billingType, BillingTypes.optional.default(nil)
    attribute :value, Types::Coercible::Decimal.optional.default(nil)
    attribute :dueDate, Types::Coercible::String.optional.default(nil)
    attribute :description, Types::Coercible::String.optional.default(nil)
    attribute :externalReference, Types::Coercible::String.optional.default(nil)
    attribute :installmentCount, Types::Coercible::String.optional.default(nil)
    attribute :installmentValue, Types::Coercible::String.optional.default(nil)
    attribute :discount, Discount.optional.default(nil)
    attribute :interest, Interest.optional.default(nil)
    attribute :fine, Fine.optional.default(nil)
  end
end