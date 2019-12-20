# frozen_string_literal: true

class InvoiceRowsController < ApplicationController
  # before_action :set_default_response_format, only: :create
  def create
    invoice = Invoice.find(params[:invoice_id])
    new_row = invoice.invoice_rows.create(invoice_row_params)

    if new_row.persisted?
      html = render_to_string('_row_display', formats: :html, layout: false, locals: {rows: invoice.reload.invoice_rows})
      render json: {html: html}, format: :json
    else
      render json: {error: "<p name='error' style='color: red;'>That didn't fly: #{new_row.errors.full_messages.to_sentence}</p>"}, format: :json, status: :unprocessable_entity
    end

  end

  def new
    @invoice = Invoice.find(params[:invoice_id])
    @html = render_to_string('_form', formats: :html, layout: false)
  end

  private

  def invoice_row_params
    params.require(:row).permit(:quantity, :article_id)
  end

  def set_default_response_format
    request.format = :json
  end
end
