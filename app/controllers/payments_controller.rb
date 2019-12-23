class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @invoice = Invoice.find(params[:record])
  end

  def create
  end

end
