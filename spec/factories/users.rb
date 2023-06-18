FactoryBot.define do
  factory :user do
    name { "test" }
    number { 1 }
    email  { "test@example.com" }
    password  { "password" }
  end
end
