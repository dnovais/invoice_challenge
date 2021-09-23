# frozen_string_literal: true

module Api
  class InvoicesController < ApplicationController
    def index
      Invoice::Fetch.call(params: params) do |on|
        on.failure { raise NotImplementedError }
        on.success { |result| render_json(200, invoices: result[:invoices]) }
      end
    end
  end
end
