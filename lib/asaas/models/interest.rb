module Asaas
  class Interest < Model
    InterestTypes = Types::Strict::String.enum('FIXED', 'PERCENTAGE')

    attribute :value, Types::Coercible::Float
    attribute :type, InterestTypes.optional.default(nil)
  end
end