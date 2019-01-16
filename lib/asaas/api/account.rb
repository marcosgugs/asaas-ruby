module Asaas
  module Api
    class Account < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/accounts')
      end

    end
  end
end