module Asaas
  class Discount < Model
    transform_keys(&:to_sym)
    
    DiscountTypes = Types::Strict::String.enum('FIXED', 'PERCENTAGE')
    attribute :value, Types::Coercible::Decimal
    attribute :dueDateLimitDays, Types::Coercible::Integer.optional.default(0)
    attribute :type, DiscountTypes
  end
end