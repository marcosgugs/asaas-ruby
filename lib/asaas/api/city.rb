module Asaas
  module Api
    class City < Asaas::Api::Base

      def initialize(token)
        super(token, '/cities')
      end

    end
  end
end