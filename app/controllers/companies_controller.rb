class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_company, only: :new

  def new
    @company = Company.new
  end
  
  def create
    company = Company.create(company_params)

    if company.persisted?
      redirect_to invoices_path, notice: "Company information added."
    else
      redirect_to new_company_path, notice: "Something went wrong. #{company.errors.full_messages.to_sentence}"
    end
  end 

  def show
    @company = Company.find(params[:id])
  end

  private
  def check_user_company
    if current_user.company.present?
      redirect_to company_path(current_user.company), notice: 'You have already added your company information'
    end
  end
  
  def company_params
    params.require(:company).permit(:name, :identification_no, :vat_no, :address, :postcode, :city, :phone).merge(:user_id => current_user[:id])
  end
end
