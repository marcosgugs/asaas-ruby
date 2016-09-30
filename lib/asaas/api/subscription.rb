module Asaas
  module Api
    class Subscription < Asaas::Api::Base

      def initialize(token)
        super(token, '/subscriptions')
      end

    end
  end
end