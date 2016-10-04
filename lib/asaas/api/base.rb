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
        request(:post, {}, attrs)
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
        res = case @response.response_code
          when 200
            response_success
          when 400
            response_bad_request
          when 401
            response_unauthorized
          when 404
            response_not_found
          when 500
            response_internal_server_error
        end
        res
      end

      def convert_data_to_entity(type)
        "Asaas::Entity::#{type.capitalize}".constantize
      end

      def request(method, params = {}, body = nil)
        body = body && body.try(:attributes)
        @response = Typhoeus::Request.new(
            parse_url(params.fetch(:id, false)),
            method: method,
            body: body,
            params: params,
            headers: { 'access_token': @token || Asaas::Configuration.token }
        ).run
      end

      def response_success
        hash = JSON.parse(@response.body)
        if hash.fetch("object", false) === "list"
          entity = Asaas::Entity::Meta.new(hash)
        else
          entity = convert_data_to_entity(hash.fetch("object", false))
          entity.new(hash) if entity
        end
        entity
      end

      def response_unauthorized
        error = Asaas::Entity::Error.new
        error.errors << Asaas::Entity::ErrorItem.new(code: 'invalid_token', description: 'The api_key is invalid')
        error
      end

      def response_internal_server_error
        error = Asaas::Entity::Error.new
        error.errors << Asaas::Entity::ErrorItem.new(code: 'internal_server_error', description: 'Internal Server Error')
        error
      end

      def response_not_found
        error = Asaas::Entity::Error.new
        error.errors << Asaas::Entity::ErrorItem.new(code: 'not_found', description: 'Object not found')
        error
      end

      def response_bad_request
        error = Asaas::Entity::Error.new
        begin
          hash = JSON.parse(@response.body)
          errors = hash.fetch("errors", [])
          errors.each do |item|
            error.errors << Asaas::Entity::ErrorItem.new(item)
          end
          error
        rescue
          error = Asaas::Entity::Error.new
          error.errors << Asaas::Entity::ErrorItem.new(code: 'bad_request', description: 'Bad Request')
          error
        end
        error
      end

      def get_headers
        { 'access_token': @token || Asaas::Configuration.token }
      end
    end
  end
end