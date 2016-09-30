module Asaas
  module Entity
    class Installment
      include Virtus.model

      attribute :data, Array

    end
  end
end