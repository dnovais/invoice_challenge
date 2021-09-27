# frozen_string_literal: true

module Api
  class InvoicesController < ApplicationController
    def index
      Invoice::Fetch.call(params: params) do |on|
        on.failure { raise NotImplementedError }
        on.success { |result| render_json(200, invoices: result[:invoices]) }
      end
    end

    def show
      find_invoice
      .on_failure(:invoice_not_found) { render_json(404, invoice: { id: 'not found' })  }
      .on_success { |result| render_json(200, invoice: Invoice::Serialize.as_json(result[:invoice])) }
    end

    def create
      Invoice::Create.call(params: params)
      .then(Invoice::SendEmail)
      .on_failure { |result| render_json(422, invoice: Invoice::Serialize.as_json(result[:invoice])) }
      .on_success { |result| render_json(201, invoice: Invoice::Serialize.as_json(result[:invoice])) }
    end

    def update
      find_invoice
        .then(Invoice::Update)
        .on_failure { |result| render_json(422, invoice: Invoice::Serialize.as_json(result[:invoice])) }
        .on_success { |result| render_json(201, invoice: Invoice::Serialize.as_json(result[:invoice])) }
    end

    private

    def find_invoice
      Invoice::Find.call(params: params)
    end
  end
end
