module Asaas
  module Entity
    class Customer < Asaas::Entity::Base

      attribute :id, String
      attribute :name, String
      attribute :email, String
      attribute :company, String
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
      attribute :foreignCustomer, Axiom::Types::Boolean
      attribute :notificationDisabled, Axiom::Types::Boolean
      attribute :cpfCnpj, String
      attribute :personType, String
      attribute :subscriptions, Asaas::Entity::Meta
      attribute :payments, Asaas::Entity::Meta
      attribute :notifications, Asaas::Entity::Meta

    end
  end
end