module Asaas
  module Entity
    class Error
      include Virtus.model

      attribute :errors, Array[ErrorItem]

    end
  end
end