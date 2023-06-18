FactoryBot.define do
  factory :negotiation do
    name { "test_negotiation" }
    selling_price { 100 }
    wholesale_price { 100 }
    explanation { "test_explanation" }
    user { FactoryBot.create(:user) }
    product { FactoryBot.create(:product) }
  end
end
