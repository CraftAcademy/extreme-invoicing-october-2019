class InvoicesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @invoices = current_user.invoices
    @customers = current_user.customers
  end

  def new
    invoice_number = current_user.invoices.count + 1
    invoice = Invoice.create(date: Date.today, due_date: Date.today + 30.days, user: current_user, invoice_number: invoice_number)
    redirect_to invoices_path
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    total = calculate_total(params)

    invoice = Invoice.find(params[:id])
    invoice.update(total: total)

    if invoice.errors.empty?
      redirect_to request.referer, notice: "Invoice draft successfully saved"
    else
      redirect_to request.referer, notice: "There was an error"
    end
  end

  private

  def calculate_total(params)
    quantity = params[:invoice][:quantity].to_f
    price = params[:invoice][:unit_price].to_f
    vat_multiplier = 1 + params[:invoice][:vat].to_f / 100
    total = quantity * price * vat_multiplier
  end

end
