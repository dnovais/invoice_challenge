# frozen_string_literal: true

class Invoice::Create < Micro::Case
  attribute :params, validates: { kind: { respond_to: ActionController::Parameters } }

  def call!
    invoice = Invoice.create(invoice_params)

    if invoice.save
      Success result: { invoice: invoice }
    else
      Failure result: { invoice: invoice.errors.as_json }
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :title,
      :status,
      :description,
      :discount_percentage,
      :discount_amount,
      :tax_percentage,
      :tax_amount,
      :due_date,
      :sub_total,
      :total,
      items_attributes: [
        :name,
        :description,
        :unit_cost,
        :quantity
      ],
      client_attributes: [
        :name,
        :email,
        :cpf,
        :address,
        :phone
      ],
      company_attributes: [
        :name,
        :email,
        :cnpj,
        :address,
        :phone
      ]
    )
  end
end
