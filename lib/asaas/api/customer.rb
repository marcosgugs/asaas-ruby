module Asaas
  module Api
    class Customer < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/customers')
      end

    end
  end
end