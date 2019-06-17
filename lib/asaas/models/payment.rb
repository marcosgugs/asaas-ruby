module Asaas
  class Payment < Model
    BillingTypes = Types::Strict::String.enum('BOLETO', 'CREDIT_CARD', 'UNDEFINED', 'TRANSFER')
    Status = Types::Strict::String.enum('PENDING', 'RECEIVED', 'CONFIRMED', 'OVERDUE', 'REFUNDED', 'RECEIVED_IN_CASH', 'REFUND_REQUESTED', 'CHARGEBACK_DISPUTE', 'AWAITING_CHARGEBACK_REVERSAL')

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

    attribute :status, Status.optional.default(nil)
    attribute :dateCreated, Types::Coercible::String.optional.default(nil)
    attribute :subscription, Types::Coercible::String.optional.default(nil)
    attribute :originalDueDate, Types::Coercible::String.optional.default(nil)
    attribute :originalValue, Types::Coercible::Decimal.optional.default(nil)
    attribute :interestValue, Types::Coercible::Decimal.optional.default(nil)
    attribute :confirmedDate, Types::Coercible::String.optional.default(nil)
    attribute :paymentDate, Types::Coercible::String.optional.default(nil)
    attribute :clientPaymentDate, Types::Coercible::String.optional.default(nil)
    attribute :invoiceUrl, Types::Coercible::String.optional.default(nil)
    attribute :bankSlipUrl, Types::Coercible::String.optional.default(nil)
    attribute :invoiceNumber, Types::Coercible::String.optional.default(nil)
    attribute :deleted, Types::Coercible::String.optional.default(nil)

  end
end