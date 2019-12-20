module CompanyHelper
  def check_user_company(user)
    if user.company.present?
      company_path(user.company.id)
    else
      new_company_path
    end
  end
end 