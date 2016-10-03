module Asaas
  module Api
    class Base

      attr_reader :endpoint
      attr_reader :meta
      attr_reader :errors
      attr_reader :success
      attr_reader :token
      attr_accessor :route

      def initialize(client_token, route = nil)
        @token    = client_token
        @route    = route
        @endpoint = Asaas::Configuration.get_endpoint
      end

      def extract_meta(meta)
        @meta = Asaas::Entity::Meta.new(meta)
      end

      def get(id)
        request(:get, {id: id})
        parse_response
      end

      def list
        request(:get)
        parse_response
      end

      def create(attrs)
        ap request(:post, {}, attrs)
        parse_response
      end

      def update(attrs)
        request(:put, {id: attrs.id}, attrs)
        parse_response
      end

      def delete(id)
        request(:put, {id: id})
        parse_response
      end

      protected
      def parse_url(id = nil)
        u = URI(@endpoint + @route)
        if id
          u.path += "/#{id}"
        end
        u.to_s
      end

      def parse_response
        ap hash
        hash = JSON.parse(@response.body)
        @errors = false
        @success = true
        if hash.fetch("errors", false)
          @errors   = hash.fetch("errors")
          @success  = false
        elsif hash.fetch("object", false) === "list"
          Asaas::Entity::Meta.new(hash)
        else
          entity = convert_data_to_entity(hash.fetch("object", false))
          entity.new(hash) if entity
        end
      end

      def convert_data_to_entity(type)
        "Asaas::Entity::#{type.capitalize}".constantize
      end

      def request(method, params = {}, body = nil)
        @response = Typhoeus::Request.new(
            parse_url(params.fetch(:id, false)),
            method: method,
            body: body.attributes,
            params: params,
            headers: { 'access_token': @token || Asaas::Configuration.token }
        ).run
      end

      def get_headers
        { 'access_token': @token || Asaas::Configuration.token }
      end
    end
  end
end