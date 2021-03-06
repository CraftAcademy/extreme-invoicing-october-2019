class InvoicesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @invoices = Invoice.all
    @customers = current_user.customers
    @articles = current_user.articles
  end

  def show
    @invoice = Invoice.find(params[:id])
    authorize @invoice
  end

  def new
    invoice = Invoice.create(date: Date.today, due_date: Date.today + 30.days, user: current_user)
    redirect_to invoices_path
  end
end
