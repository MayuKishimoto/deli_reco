FactoryBot.define do
  factory :affiliation do
    association :user
    association :department
  end
end
