module Asaas
  module Api
    class Base

      attr_reader :endpoint
      attr_reader :meta
      attr_reader :errors
      attr_reader :success
      attr_reader :token
      attr_accessor :route

      def initialize(client_token, api_version, route = nil)
        @token    = client_token
        @route    = route
        @api_version = api_version || Asaas::Configuration.api_version
        @endpoint = Asaas::Configuration.get_endpoint(api_version)
        puts @endpoint if Asaas::Configuration.debug
      end

      def extract_meta(meta)
        @meta = Asaas::Entity::Meta.new(meta)
      end

      def get(id)
        request(:get, parse_url(id), {id: id})
        parse_response
      end

      def list(params = {})
        request(:get, parse_url, params)
        parse_response
      end

      def create(attrs)
        request(:post, parse_url, {}, attrs)
        parse_response
      end

      def update(attrs)
        request(:post, parse_url(attrs.id), {id: attrs.id}, attrs)
        parse_response
      end

      def delete(id)
        request(:delete, parse_url(id), {id: id})
        parse_response
      end

      protected
      def parse_url(id = nil)
        u = resource_uri
        if id
          u.path += "/#{id}"
        end
        u.to_s
      end

      def resource_uri
        URI(@endpoint + @route)
      end

      def parse_response
        res =  @response.response_code
        puts res
        case @response.response_code
          when 200
            res = response_success
          when 400
            res = response_bad_request
          when 401
            res = response_unauthorized
          when 404
            res = response_not_found
          when 500
            res = response_internal_server_error
          else
            res = response_not_found
        end
        res
      end

      def convert_data_to_entity(type)
        if @api_version == 2
          "Asaas::Entity::#{type.capitalize}".constantize
        else
          "Asaas::#{type.capitalize}".constantize
        end
      rescue StandardError => e
        Asaas::Entity::Base
      end

      def request(method, url, params = {}, body = nil)
        body = body.to_h
        body = body.delete_if { |k, v| v.nil? || v.to_s.empty? }
        body = body.to_json
        @response = Typhoeus::Request.new(
            url,
            method: method,
            body: body,
            params: params,
            headers: {
              'access_token': @token || Asaas::Configuration.token,
              'Content-Type': 'application/json'
             },
            verbose: Asaas::Configuration.debug
        ).run
      end

      def response_success
        entity = nil
        hash = JSON.parse(@response.body)
        puts hash if Asaas::Configuration.debug
        if hash.fetch("object", false) === "list"
          entity = Asaas::Entity::Meta.new(hash)
        else
          entity = convert_data_to_entity(hash.fetch("object", false))
          entity = entity.new(hash) if entity
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
