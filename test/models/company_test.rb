require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'when company has many invoices' do
    # arrange
    company = companies(:one)

    # act
    company_invoices = company.invoices

    # assert
    assert_equal 2, company_invoices.count
  end

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
    assert_equal("can't be blank, the cnpj:  is not valid", company_errors[:cnpj])
  end

  test 'when format of company email is not valid' do
    # arrange
    name = 'SOS ME'
    email = 'a@a'
    cnpj = '81.762.410/8905-09'
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
    cnpj = '81.762.410/8905-09'
    address = 'Via de Pedestre Eurídice 896 Jardim Brasil (Zona Norte) São Paulo SP'
    phone = '(11) 2677-8628'

    # act
    company = Company.create(name: name, email: email, cnpj: cnpj, address: address, phone: phone)

    # assert
    assert company.errors.present?

    company_errors = company.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('has already been taken', company_errors[:email])
  end

  test 'when cnpj already exists' do
    # arrange
    name = 'Other Company ME'
    email = 'contact@othercompany.com'
    cnpj = companies(:one).cnpj
    address = 'Via de Pedestre Eurídice 896 Jardim Brasil (Zona Norte) São Paulo SP'
    phone = '(11) 2677-8628'

    # act
    company = Company.create(name: name, email: email, cnpj: cnpj, address: address, phone: phone)

    # assert
    assert company.errors.present?

    company_errors = company.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('has already been taken', company_errors[:cnpj])
  end

  test 'when cnpj is not valid' do
    # arrange
    name = 'Other Company ME'
    email = 'contact@othercompany.com'
    cnpj = '99999999999'
    address = 'Via de Pedestre Eurídice 896 Jardim Brasil (Zona Norte) São Paulo SP'
    phone = '(11) 2677-8628'

    # act
    company = Company.create(name: name, email: email, cnpj: cnpj, address: address, phone: phone)

    # assert
    assert company.errors.present?

    company_errors = company.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal('the cnpj: 99999999999 is not valid', company_errors[:cnpj])
  end
end
