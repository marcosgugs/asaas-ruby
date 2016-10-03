require 'awesome_print'
require 'active_support'
require 'active_support/inflector'
require 'rest-client'
require 'typhoeus'
require 'asaas/version'
require 'virtus'
require 'json'

module Asaas
  autoload :Entity, 'asaas/entity'
  autoload :Configuration, 'asaas/configuration'
  autoload :Api, 'asaas/api'
  autoload :Client, 'asaas/client'

  class << self

    def setup(&block)
      Asaas::Configuration.setup(&block)
    end

  end


end
