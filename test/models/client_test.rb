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
    assert_equal("can't be blank, the cnpj:  is not valid", client_errors[:cnpj])
  end
end
