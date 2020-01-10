module Asaas
    class Account < Model
      attribute :id, Types::Coercible::String.optional.default(nil)
      attribute :walletId, Types::Coercible::String.optional.default(nil)
      attribute :name, Types::Coercible::String.optional
      attribute :email, Types::Coercible::String.optional
      attribute :cpfCnpj, Types::Coercible::String.optional
      attribute :phone, Types::Coercible::String.optional
      attribute :mobilePhone, Types::Coercible::String.optional
      attribute :address, Types::Coercible::String.optional
      attribute :addressNumber, Types::Coercible::String.optional
      attribute :complement, Types::Coercible::String.optional
      attribute :province, Types::Coercible::String.optional
      attribute :postalCode, Types::Coercible::String.optional
      attribute :apiKey, Types::Coercible::String.optional.default(nil)
      attribute :companyType, Types::Coercible::String.optional.default(nil) 
    end
  end