module Asaas
  module Api
    class Transfer < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/transfers')
      end

    end
  end
end
