module Asaas
  module Api
    class Payment < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/payments')
      end

    end
  end
end