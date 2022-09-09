module Asaas
  class Notification < Model
    transform_keys(&:to_sym)
    
    attribute :id, Types::Coercible::String
    attribute :customer, Types::Coercible::String
    attribute :event, Types::Coercible::String
    attribute :scheduleOffset, Types::Integer.optional.default(nil)
    attribute :emailEnabledForProvider, Types::Bool.optional.default(false)
    attribute :smsEnabledForProvider, Types::Bool.optional.default(false)
    attribute :emailEnabledForCustomer, Types::Bool.optional.default(true)
    attribute :smsEnabledForCustomer, Types::Bool.optional.default(false)
    attribute :enabled, Types::Bool.default(false)
  end
end