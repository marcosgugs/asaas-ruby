# Asaas Ruby

[![Build Status](https://travis-ci.org/thiagodiniz/asaas-ruby.svg?branch=master)](https://travis-ci.org/thiagodiniz/asaas-ruby)

A biblioteca Asaas Ruby tem provê um acesso a API Rest do asaas.com.br

## Installation

You don't need this source code unless you want to modify the gem. If you just
want to use the package, just run:

```sh
gem install asaas-ruby
```

Para fazer o build da gem

```sh
gem build asaas-ruby.gemspec
```

### Changelog

 - 0.2.24 - Add support to PIX billing type and fills missing CHANGELOG entries
 - 0.2.23 - Add support to Ruby 2.7 and Rails 6.1
 - 0.2.22 - Remove unecessary ActiveSupport version limit
 - 0.2.21 - Add credit fields to Payment
 - 0.2.20 - Adds debug flag to check responses
 - 0.2.19 - Small fixes
 - 0.2.18 - Account documents upload
 - 0.2.17 - Add support to DEPOSIT billing type
 - 0.2.16 - Wallet account tranfers
 - 0.2.15 - Bank account tranfers

### Requirements

- Ruby 2.3+.

## Usage

```ruby
require 'asaas-ruby'

Asaas.setup do |config|
  config.token = 'token'
end

asaas_client = Asaas::Client.new()

customer = Asaas::Customer.new({name: 'Thiago Diniz', cpfCnpj: '05201932419', email: 'email@example.org'})
asaas_client.customers.create(customer)

charge = Asaas::Payment.new({
  customer: customer.id,
  dueDate: '2019-10-10',
  billingType: 'BOLETO',
  description: "Teste de boleto",
  value: BigDecimal("103.54").to_f,
  postalService: false
})

asaas_client.payments.create(charge)
```