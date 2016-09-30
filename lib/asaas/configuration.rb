module Asaas
  module Configuration

    mattr_accessor :staging_endpoint do
      'http://homolog.asaas.com/api/v2'
    end

    mattr_accessor :production_endpoint do
      'https://www.asaas.com/api/v2'
    end

    mattr_accessor :production do
      false
    end

    mattr_accessor :token

    class << self

      def setup(&block)
        yield self if block_given?
        self
      end

      def get_endpoint
        if production
          production_endpoint
        else
          staging_endpoint
        end
      end

      def get_environment
        if production
          :production
        else
          :staging
        end
      end

    end

  end
end