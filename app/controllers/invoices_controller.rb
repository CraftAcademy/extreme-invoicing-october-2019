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

end
