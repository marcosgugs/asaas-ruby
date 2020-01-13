module Asaas
  module Api
    autoload :Base, 'asaas/api/base'
    autoload :Account, 'asaas/api/account'
    autoload :City, 'asaas/api/city'
    autoload :Customer, 'asaas/api/customer'
    autoload :Notification, 'asaas/api/notification'
    autoload :Payment, 'asaas/api/payment'
    autoload :Subscription, 'asaas/api/subscription'
    autoload :Webhook, 'asaas/api/webhook'
    autoload :Transfer, 'asaas/api/transfer'
    autoload :Document, 'asaas/api/document'
  end
end