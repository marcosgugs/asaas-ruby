module Asaas
  class Client

    attr_reader :token

    def initialize(token = nil, api_version = nil)
      @token = token || Asaas::Configuration.token
      @api_version = api_version || Asaas::Configuration.api_version
    end

    def accounts
      @accounts ||= Asaas::Api::Account.new(@token, @api_version)
    end

    def cities
      @cities ||= Asaas::Api::City.new(@token, @api_version)
    end

    def customers
      @customers ||= Asaas::Api::Customer.new(@token, @api_version)
    end

    def notifications
      @notifications ||= Asaas::Api::Notification.new(@token, @api_version)
    end

    def payments
      @payments ||= Asaas::Api::Payment.new(@token, @api_version)
    end

    def subscriptions
      @subscriptions ||= Asaas::Api::Subscription.new(@token, @api_version)
    end

    def transfers
      @transfers ||= Asaas::Api::Transfer.new(@token, @api_version)
    end

    def webhooks
      @webhooks ||= Asaas::Api::Webhook.new(@token, @api_version)
    end

    def documents
      @documents ||= Asaas::Api::Document.new(@token, @api_version)
    end

  end
end
