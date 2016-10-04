module Asaas
  module Entity
    class ErrorItem
      include Virtus.model
      attribute :code, String
      attribute :description, String
    end
  end
end