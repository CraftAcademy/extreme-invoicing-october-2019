# frozen_string_literal: true

Given('the following user(s) exist') do |table|
  table.hashes.each do |user_attrs|
    create(:user, user_attrs)
  end
end

Given('I am logged in as {string}') do |email|
  @user = User.find_by(email: email) || create(:user, email: email, password: 'password')
  login_as @user
end

Given("the following company exist") do |table|
  table.hashes.each do |company_attrs|
    user = User.find_by(email: company_attrs[:user]) || create(:user, email: company_attrs[:user])

    create(:company, company_attrs.except!(:user).merge(user: user))
  end
end

Given('the following customer(s) exist') do |table|
  table.hashes.each do |customer_attrs|
    user = User.find_by(email: customer_attrs['user'])
    customer_attrs.except('user')
    create(:customer, customer_attrs.merge(user: user))
  end
end

Given("the following invoices exist") do |table|
  table.hashes.each do |invoice_attrs|
    user = User.find_by(email: invoice_attrs[:user]) || create(:user, email: invoice_attrs[:user])
    create(:invoice, invoice_attrs.merge(user: user))
  end
end

Given('the following article(s) exist') do |table|
  table.hashes.each do |article_attrs|
    user = User.find_by(email: article_attrs['user'])
    article_attrs.except('user')
    create(:article, article_attrs.merge(user: user))
  end
end

Then("I should see {string} for {string}") do |content, invoice|
  invoice_number = invoice.gsub(/.* /, "")
  within("#invoice_#{invoice_number}") do
    expect(page).to have_content content
  end
end