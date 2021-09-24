# frozen_string_literal: true

class Invoice::Create < Micro::Case
  attribute :params, validates: { kind: { respond_to: ActionController::Parameters } }

  def call!
    invoice = Invoice.create(invoice_params)

    if invoice.valid?
      Success result: { invoice: invoice }
    else
      Failure result: { invoice: invoice.errors.as_json }
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :company_id,
      :client_id,
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
      ]
    )
  end
end
