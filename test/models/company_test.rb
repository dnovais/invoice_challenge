require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  test 'when all data is empty' do
    # Arrange
    company = Company.new

    # Act
    company.valid?

    # Assert
    assert company.errors.present?

    company_errors = company.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal("can't be blank", company_errors[:name])
    assert_equal("can't be blank, is invalid", company_errors[:email])
    assert_equal("can't be blank", company_errors[:cnpj])
  end
end
