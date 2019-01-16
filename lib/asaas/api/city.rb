module Asaas
  module Api
    class City < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/cities')
      end

    end
  end
end