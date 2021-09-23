# frozen_string_literal: true

module Api
  class InvoicesController < ApplicationController
    def index
      invoices = Invoice.all
      render json: invoices
    end
  end
end
