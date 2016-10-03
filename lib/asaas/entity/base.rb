module Asaas
  module Entity
    class Base
      include Virtus.model

      def empty?
        attributes.values.compact.empty?
      end
    end
  end
end