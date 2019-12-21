When("I click on {string}") do |element|
  click_on element
end

Given('(I/He/She) (am/is) on the index page') do
  visit root_path
end

Given('(I/he/she) click(s) on {string} for {string}') do |element, invoice|
  invoice_number = invoice.gsub(/.* /, "")
  within("#invoice_#{invoice_number}") do
    click_on element
  end
end

When("I select {string} from {string}") do |customer, selectbox|
  select customer, from: selectbox
end

Then('stop') do
  binding.pry
end

When("I fill in {string} with {string}") do |input, content|
  fill_in input, with: content
end

Given("I am on the new company page") do
  visit new_company_path
end 


Given("I try to visit the invoice create page") do
  visit new_invoice_path
end
