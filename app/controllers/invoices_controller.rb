# frozen_string_literal: true

class InvoicesController < ApplicationController
  def welcome; end

  def show
    @invoice = find_invoice[:invoice]

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Invoice No. #{@invoice.id}",
        page_size: 'A4',
        template: "invoices/show.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  private

  def find_invoice
    Invoice::Find.call(params: params)
  end
end
