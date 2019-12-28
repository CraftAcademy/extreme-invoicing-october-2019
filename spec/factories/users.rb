FactoryBot.define do
  factory :user do
    email { "mail#{rand(1...1000)}@mail.com" }
    password { 'MyString' }
  end
end
