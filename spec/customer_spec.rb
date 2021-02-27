require 'asaas-ruby'

RSpec.describe Asaas::Customer do

  let(:customer_token) { 'a97d808e77b51653df429b6f9eecf90e3034d6ae35393509fefa5c202bfeb8f9' }

  before do
    Asaas::Configuration.token = '544333290e93b9bbcd8107b3d9586e3bef774fb41584790a5ff061e4e0392ed5'
  end

  xit 'can create a new' do
    params = {name: 'Marcos Junior', cpfCnpj: '34960665807'}
    customer = Asaas::Customer.new(params)

    asaas_client = Asaas::Client.new(customer_token)
    expect(asaas_client.token).to eq(customer_token)

    created_customer = asaas_client.customers.create(customer)
    puts created_customer
    puts created_customer.attributes

  end

end
