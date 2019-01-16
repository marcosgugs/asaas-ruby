module Asaas
  class Interest < Model
    attribute :value, Types::Coercible::Decimal
  end
end