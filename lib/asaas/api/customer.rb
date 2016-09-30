module Asaas
  module Api
    class Customer < Asaas::Api::Base

      def initialize(token)
        super(token, '/customers')
      end

    end
  end
end