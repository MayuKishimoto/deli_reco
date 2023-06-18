FactoryBot.define do
  factory :product do
    assumed_name { "test_product" }
    assumed_selling_price { 100 }
    assumed_wholesale_price { 100 }
    start_on { "2024-01-01" }
    period { "1ヶ月" }
    volume { 100 }
    purpose { "test_purpose" }
    concept { "test_concept" }
    client { FactoryBot.create(:client) }
    category { FactoryBot.create(:category) }
    user { FactoryBot.create(:user) }
  end
end
