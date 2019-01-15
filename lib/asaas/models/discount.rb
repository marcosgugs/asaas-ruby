module Asaas
  class Discount < Dry::Struct
    DiscountTypes = Types::Strict::String.enum('FIXED', 'PERCENTAGE')
    attribute :value, Types::Coercible::Decimal
    attribute :dueDateLimitDays, Types::Coercible::Integer.optional.default(0)
    attribute :type, DiscountTypes
  end
end