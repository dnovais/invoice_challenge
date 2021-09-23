# frozen_string_literal: true

class Invoice::Fetch < Micro::Case
  attribute :params, validates: { kind: { respond_to: ActionController::Parameters } }

  def call!
    invoices = filter_invoices

    invoices = invoices.map { |invoice| as_json(invoice) }

    Success { { data: invoices } }
  end

  private

  def filter_invoices
    case params[:status]&.strip&.downcase
    when 'draft' then Invoice.draft
    when 'sent' then Invoice.sent
    when 'paid' then Invoice.paid
    when 'closed' then Invoice.closed
    else Invoice.all
    end
  end
end
