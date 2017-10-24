module Asaas
  module Entity
    class City
      include Virtus.model

      attribute :id, String
      attribute :ibgeCode, String
      attribute :name, String
      attribute :districtCode, Integer
      attribute :district, String
      attribute :state, String

    end
  end
end