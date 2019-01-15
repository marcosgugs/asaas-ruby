module Asaas
  class Interest < Dry::Struct
    attribute :value, Types::Coercible::Decimal
  end
end