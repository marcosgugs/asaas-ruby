module Asaas
  module Api
    class Subscription < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/subscriptions')
      end

      def payments(subscription_id)
        url = parse_url(subscription_id) + '/payments'

        request(:get, url, {})
        parse_response
      end

    end
  end
end
