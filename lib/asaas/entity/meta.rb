module Asaas
  module Entity
    class Data < Virtus::Attribute
      def coerce(value)
        value.map do |hash|
          if hash.has_key? "object"
            entity = convert_data_to_entity(hash["object"])
            entity.new(hash)
          else
            entity = convert_data_to_entity(hash.keys.first)
            entity.new(hash.values.first)
          end
        end
      end

      protected
      def convert_data_to_entity(type)
        "Asaas::Entity::#{type.capitalize}".constantize
      rescue
        Asaas::Entity::Base
      end
    end

    class Meta
      include Virtus.model

      attribute :limit, Integer
      attribute :offset, Integer
      attribute :hasMore, Axiom::Types::Boolean
      attribute :data, Data

    end
  end
end