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