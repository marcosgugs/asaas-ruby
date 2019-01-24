module Asaas
  class Fine < Model
    FineTypes = Types::Strict::String.enum('FIXED', 'PERCENTAGE')

    attribute :value, Types::Coercible::Float
    attribute :type, FineTypes.optional.default(nil)
  end
end