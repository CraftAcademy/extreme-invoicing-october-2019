FactoryBot.define do
  factory :company do
    name { "MyString" }
    identification_no { 1 }
    vat_no { 1 }
    address { "MyString" }
    postcode { "MyString" }
    city { "MyString" }
    phone { 1 }
    user
  end
end
