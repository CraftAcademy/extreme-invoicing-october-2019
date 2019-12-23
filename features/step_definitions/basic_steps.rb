When("I click on {string}") do |element|
  click_on element
end

Given('(I/He/She) (am/is) on the index page') do
  visit root_path
end

When("I fill in {string} with {string}") do |input, content|
  fill_in input, with: content
end

Given("I am on the new company page") do
  visit new_company_path
end 

Given("I am on the invoices page") do
  visit invoices_path
end 

Given("I am on the payment page") do
  expect(current_path).to eq new_payment_path
end

When("I fill in the Stripe form field {string} with {string}") do |field_name, value|
  case field_name
  when "Card number"
    stripe_field_name = "cardnumber"
  end
  stripe_iframe = find("iframe[name='__privateStripeFrame4']")
  within_iframe(stripe_iframe) do
    find_field(stripe_field_name).send_keys(value)
  end
end



