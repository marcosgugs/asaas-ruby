module Asaas
  class Fine < Dry::Struct
    attribute :value, Types::Coercible::Decimal
  end
end