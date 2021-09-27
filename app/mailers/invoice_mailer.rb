class InvoiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invoice_mailer.confirmation.subject
  #
  def confirmation
    @invoice = params[:invoice]

    mail(
      to: @invoice.client.email,
      subject: 'Congrats! Invoice generated!',
      content_type: 'text/plain;charset=UTF-8'
    )
  end
end
