module Asaas
  module Entity
    class Account
      include Virtus.model

      attribute :id, Integer
      attribute :name, String
      attribute :email, String
      attribute :phone, String
      attribute :mobilePhone, String
      attribute :address, String
      attribute :addressNumber, String
      attribute :complement, String
      attribute :province, String
      attribute :city, String
      attribute :state, String
      attribute :country, String
      attribute :postalCode, String
      attribute :cpfCnpj, String
      attribute :personType, String
      attribute :companyType, String
      attribute :apiKey, String
      attribute :pushNotificationUrl, String
      attribute :pushNotificationEmail, String
      attribute :bankAccount, Asaas::Entity::BankAccount

    end
  end
end