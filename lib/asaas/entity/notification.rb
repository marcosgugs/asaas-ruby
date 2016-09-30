module Asaas
  module Entity
    class Notification
      include Virtus.model

      attribute :id, Integer
      attribute :customer, String
      attribute :event, String
      attribute :scheduleOffset, Integer
      attribute :emailEnabledForProvider, Axiom::Types::Boolean
      attribute :smsEnabledForProvider, Axiom::Types::Boolean
      attribute :emailEnabledForCustomer, Axiom::Types::Boolean
      attribute :smsEnabledForCustomer, Axiom::Types::Boolean
      attribute :enabled, Axiom::Types::Boolean

    end
  end
end