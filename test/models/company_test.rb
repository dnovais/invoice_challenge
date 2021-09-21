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

  test 'when format of company email is not valid' do
    # arrange
    name = 'SOS ME'
    email = 'a@a'
    cnpj = '75.692.217/0001-09'
    address = 'Via de Pedestre Eurídice 896 Jardim Brasil (Zona Norte) São Paulo SP'
    phone = '(11) 2677-8628'

    # act
    company = Company.create(name: name, email: email, cnpj: cnpj, address: address, phone: phone)

    # assert
    assert company.errors.present?

    company_errors = company.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('is invalid', company_errors[:email])
  end

  test 'when already exists a company with email' do
    # arrange
    name = 'Other Company ME'
    email = companies(:one).email
    cnpj = '75.692.217/0001-09'
    address = 'Via de Pedestre Eurídice 896 Jardim Brasil (Zona Norte) São Paulo SP'
    phone = '(11) 2677-8628'

    # act
    company = Company.create(name: name, email: email, cnpj: cnpj, address: address, phone: phone)

    # assert
    assert company.errors.present?

    company_errors = company.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('has already been taken', company_errors[:email])
  end
end
