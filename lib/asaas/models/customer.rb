module Asaas
  class Customer < Model
    transform_keys(&:to_sym)
    
    attribute :id, Types::Coercible::String.optional.default(nil)
    attribute :name, Types::Coercible::String
    attribute :cpfCnpj, Types::Coercible::String
    attribute :email, Types::Coercible::String.optional.default(nil)
    attribute :phone, Types::Coercible::String.optional.default(nil)
    attribute :mobilePhone, Types::Coercible::String.optional.default(nil)
    attribute :address, Types::Coercible::String.optional.default(nil)
    attribute :addressNumber, Types::Coercible::String.optional.default(nil)
    attribute :complement, Types::Coercible::String.optional.default(nil)
    attribute :province, Types::Coercible::String.optional.default(nil)
    attribute :postalCode, Types::Coercible::String.optional.default(nil)
    attribute :externalReference, Types::Coercible::String.optional.default(nil)
    attribute :notificationDisabled, Types::Bool.optional.default(false)
    attribute :additionalEmails, Types::Coercible::String.optional.default(nil)
    attribute :municipalInscription, Types::Coercible::String.optional.default(nil)
    attribute :stateInscription, Types::Coercible::String.optional.default(nil)
    attribute :groupName, Types::Coercible::String.optional.default(nil)
    attribute :deleted, Types::Coercible::Bool.optional.default(false)
  end
end