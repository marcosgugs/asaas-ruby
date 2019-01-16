module Asaas
  class Model < Dry::Struct
    transform_keys(&:to_sym)
  end
end