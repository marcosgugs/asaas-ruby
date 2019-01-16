module Asaas
  module Api
    class Notification < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/notifications')
      end

    end
  end
end