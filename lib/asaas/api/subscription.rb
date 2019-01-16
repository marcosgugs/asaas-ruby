module Asaas
  module Api
    class Subscription < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/subscriptions')
      end

    end
  end
end