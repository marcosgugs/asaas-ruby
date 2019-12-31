module Asaas
  class Subscription < Model
    Cycles = Types::Strict::String.enum('WEEKLY', 'BIWEEKLY', 'MONTHLY', 'QUARTERLY', 'SEMIANNUALLY', 'YEARLY')
    BillingTypes = Types::Strict::String.enum('BOLETO', 'CREDIT_CARD', 'UNDEFINED', 'TRANSFER')
    Status = Types::Strict::String.enum('ACTIVE', 'EXPIRED')

    attribute :id, Types::Coercible::String
    attribute :dateCreated, Types::Coercible::String.optional.default(nil)
    attribute :customer, Types::Coercible::String.optional.default(nil)
    attribute :value, Types::Coercible::Decimal.optional.default(nil)
    attribute :nextDueDate, Types::Coercible::String.optional.default(nil)
    attribute :description, Types::Coercible::String.optional.default(nil)
    attribute :externalReference, Types::Coercible::String.optional.default(nil)
    attribute :endDate, Types::Coercible::String.optional.default(nil)
    attribute :maxPayments, Types::Coercible::String.optional.default(nil)
    attribute :deleted, Types::Coercible::String.optional.default(nil)

    attribute :billingType, BillingTypes
    attribute :cycle, Cycles
    attribute :status, Status

    attribute :discount, Dry::Struct.meta(omittable: true) do
      attribute :value, Types::Coercible::Decimal.optional.default(nil)
      attribute :dueDateLimitDays, Types::Coercible::Integer.optional.default(nil)
    end

    attribute :fine, Dry::Struct.meta(omittable: true) do
      attribute :value, Types::Coercible::Decimal.optional.default(nil)
    end

    attribute :interest, Dry::Struct.meta(omittable: true) do
      attribute :value, Types::Coercible::Decimal.optional.default(nil)
    end
  end
end
