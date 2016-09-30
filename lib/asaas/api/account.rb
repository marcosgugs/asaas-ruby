module Asaas
  module Api
    class Account < Asaas::Api::Base

      def initialize(token)
        super(token, '/accounts')
      end

    end
  end
end