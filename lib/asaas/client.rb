module Asaas
  class Client

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def accounts
      @accounts ||= Asaas::Api::Account.new(@token)
    end

    def cities
      @cities ||= Asaas::Api::City.new(@token)
    end

    def customers
      @customers ||= Asaas::Api::Customer.new(@token)
    end

    def notifications
      @notifications ||= Asaas::Api::Notification.new(@token)
    end

    def payments
      @payments ||= Asaas::Api::Payment.new(@token)
    end

    def subscriptions
      @subscriptions ||= Asaas::Api::Subscription.new(@token)
    end

  end
end