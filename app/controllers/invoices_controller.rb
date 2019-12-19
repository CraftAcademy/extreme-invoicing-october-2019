class InvoicesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @invoices = current_user.invoices
    @customers = current_user.customers
  end

  def new
    invoice = Invoice.create(date: Date.today, due_date: Date.today + 30.days, user: current_user)
    redirect_to invoices_path
  end
end
