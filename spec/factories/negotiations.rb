FactoryBot.define do
  factory :negotiation do
    negotiate_at { "2024-01-01" }
    name { "test_negotiation" }
    selling_price { 100 }
    wholesale_price { 100 }
    explanation { "test_explanation" }
    user { FactoryBot.create(:developer_user) }
    product { FactoryBot.create(:product) }
  end
end
