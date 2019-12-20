class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :invoice_not_paid_for

  private

  def invoice_not_paid_for(exception)
    if exception.policy.class == InvoicePolicy && exception.query == "show?"
    redirect_to invoices_path, notice: "You have to pay for this invoice before you can view it"
    else 
    redirect_to invoice_path(params[:id]), notice: "Welcome to download!"
    end
  end
end
