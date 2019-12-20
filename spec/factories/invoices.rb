FactoryBot.define do
  factory :invoice do
    invoice_number { rand(1000...3000)}
    date { Date.today }
    due_date { Date.today + 30.days }
    subtotal { 1.5 }
    tax { 1.5 }
    total { 1.5 }
    paid_for { "" }
    user
  end
end
