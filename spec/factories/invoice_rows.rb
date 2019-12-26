FactoryBot.define do
  factory :invoice_row do
    invoice 
    article 
    quantity { rand(10...300) }
  end
end
