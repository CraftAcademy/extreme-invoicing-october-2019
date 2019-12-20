FactoryBot.define do
  factory :invoice_row do
    invoice 
    article 
    quantity { "" }
  end
end
