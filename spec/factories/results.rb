FactoryBot.define do
  factory :result do
    content { "test_content" }
    user { FactoryBot.create(:user) }
    negotiation { FactoryBot.create(:negotiation) }
  end
end
