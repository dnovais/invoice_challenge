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

  test 'when format of client email is not valid' do
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

  test 'when already exists a client with email' do
    # arrange
    name = 'Agatha Beatriz da Mata'
    email = clients(:one).email
    cpf = '033.704.441-43'
    address = 'Rua Antônio Teixeira Morales'
    phone = '(51) 3751-4077'

    # act
    client = Client.create(name: name, email: email, cpf: cpf, address: address, phone: phone)

    # assert
    assert client.errors.present?

    client_errors = client.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('has already been taken', client_errors[:email])
  end

  test 'when cpf already exists' do
    # arrange
    name = 'Agatha Beatriz da Mata'
    email = 'contact@agathabea.com'
    cpf = clients(:one).cpf
    address = 'Rua Eurídice Jardim Brasil (Zona Norte) São Paulo SP'
    phone = '(11) 2677-8628'

    # act
    client = Client.create(name: name, email: email, cpf: cpf, address: address, phone: phone)

    # assert
    assert client.errors.present?

    client_errors = client.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('has already been taken', client_errors[:cpf])
  end

  test 'when cpf is not valid' do
    # arrange
    name = 'Fernando Alves'
    email = 'contact@fernandoalves.com'
    cpf = '99999999999'
    address = 'rua a3 Jardim Esmeralda São Paulo SP'
    phone = '(11) 2457-3624'

    # act
    client = Client.create(name: name, email: email, cpf: cpf, address: address, phone: phone)

    # assert
    assert client.errors.present?

    client_errors = client.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('the cpf: 99999999999 is not valid', client_errors[:cpf])
  end
end
