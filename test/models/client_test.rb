require "test_helper"

class ClientTest < ActiveSupport::TestCase
  test 'when all data is empty' do
    # Arrange
    client = Client.new

    # Act
    client.valid?

    # Assert
    assert client.errors.present?

    client_errors = client.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal("can't be blank", client_errors[:name])
    assert_equal("can't be blank, is invalid", client_errors[:email])
    assert_equal("can't be blank, the cpf:  is not valid", client_errors[:cpf])
  end

  test 'when format of company email is not valid' do
    # arrange
    name = 'Agatha Beatriz da Mata'
    email = 'a@a'
    cpf = '033.704.441-43'
    address = 'Rua Antônio Teixeira Morales'
    phone = '(51) 3751-4077'

    # act
    client = Client.create(name: name, email: email, cpf: cpf, address: address, phone: phone)

    # assert
    assert client.errors.present?

    client_errors = client.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('is invalid', client_errors[:email])
  end
end
