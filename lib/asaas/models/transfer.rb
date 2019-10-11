module Asaas
  class Transfer < Model
    Status = Types::Strict::String.enum('PENDING', 'BANK_PROCESSING', 'DONE',
                                        'CANCELLED', 'FAILED')

    attribute :id, Types::Coercible::String.optional.default(nil)
    attribute :dateCreated, Types::Coercible::String.optional.default(nil)
    attribute :value, Types::Coercible::Decimal.optional.default(nil)
    attribute :netValue, Types::Coercible::Decimal.optional.default(nil)
    attribute :transferFee, Types::Coercible::Decimal.optional.default(nil)
    attribute :status, Status.optional.default(nil)
    attribute :effectiveDate, Types::Coercible::String.optional.default(nil)
    attribute :scheduleDate, Types::Coercible::String.optional.default(nil)
    attribute :authorized, Types::Coercible::String.optional.default(nil)
    attribute :transactionReceiptUrl, Types::Coercible::String.optional.default(nil)
    attribute :bankAccount, Types::Coercible::Hash.optional.default(nil)
    attribute :type, Types::Coercible::String.optional.default(nil)
  end
end
