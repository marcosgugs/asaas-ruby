module Asaas
  module Configuration

    ENDPOINT_PRODUCTION = {
      v2: 'https://www.asaas.com/api/v2',
      v3: 'https://www.asaas.com/api/v3',
    }

    ENDPOINT_HOMOLOG = {
      v2: 'https://homolog.asaas.com/api/v2',
      v3: 'https://sandbox.asaas.com/api/v3',
    }

    mattr_accessor :production do
      false
    end

    mattr_accessor :debug do
      false
    end

    mattr_accessor :webhook_url do
      nil
    end

    mattr_accessor :webhook_email do
      nil
    end

    mattr_accessor :api_version do
      3
    end

    mattr_accessor :token

    mattr_accessor :debug do
      false
    end

    class << self

      def setup(&block)
        yield self if block_given?
        self
      end

      def get_endpoint(api_version = nil)
        api_version ||= Asaas::Configuration.api_version
        if production
          ENDPOINT_PRODUCTION[:"v#{api_version}"]
        else
          ENDPOINT_HOMOLOG[:"v#{api_version}"]
        end
      end

      def get_environment
        if production
          :production
        else
          :homolog
        end
      end

    end

  end
end