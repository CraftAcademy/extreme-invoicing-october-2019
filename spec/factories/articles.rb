FactoryBot.define do
  factory :article do
    name { "MyString" }
    unit { "MyString" }
    unit_price { 1.5 }
    taxrate { 1.5 }
    user
  end
end
