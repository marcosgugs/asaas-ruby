module Asaas
  module Api
    class Payment < Asaas::Api::Base

      def initialize(token)
        super(token, '/payments')
      end

    end
  end
end