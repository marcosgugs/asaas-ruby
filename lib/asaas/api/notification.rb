module Asaas
  module Api
    class Notification < Asaas::Api::Base

      def initialize(token)
        super(token, '/notifications')
      end

    end
  end
end