module Asaas
  module Api
    class Document < Asaas::Api::Base

      def initialize(token)
        super(token, 2, '/documents')
      end

      def upload(document_type, group_type, file)
        group_types = %w[ASAAS_ACCOUNT_OWNER PARTNER LIMITED_COMPANY]
        types = %w[IDENTIFICATION SOCIAL_CONTRACT]

        raise ArgumentError, 'Wrong document_type' unless types.include? document_type
        raise ArgumentError, 'Wrong group_type' unless group_types.include? group_type

        @response = Typhoeus.post(URI(endpoint + route).to_s,
                                  body: {
                                    documentType: document_type
                                    documentGroupType: group_type,
                                    documentFile: file
                                  },
                                  headers: {
                                    'access_token': @token || Asaas::Configuration.token,
                                    'Content-Type': 'multipart/form-data'
                                  },
                                  verbose: Asaas::Configuration.debug
                    )
        @response
      end

    end
  end
end
