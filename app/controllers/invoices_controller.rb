# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @invoices = current_user.invoices
    @customers = current_user.customers
    @articles = current_user.articles
  end

  def new
    invoice_number = current_user.invoices.count + 1
    # TODO: refactor this to use the create action
    @invoice = Invoice.create(date: Date.today,
                              due_date: Date.today + 30.days,
                              user: current_user,
                              invoice_number: invoice_number)
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    total = calculate_total(params)
    customer = Customer.find(params[:invoice][:customer])
    invoice = Invoice.find(params[:id])
    invoice.update(total: total, customer: customer)

    if invoice.errors.empty?
      # render :update
      redirect_to root_path, notice: 'Invoice successfully saved'
    else
      redirect_to request.referer, notice: 'There was an error'
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
