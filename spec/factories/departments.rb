FactoryBot.define do
  factory :sales_department, class: Department do
    name { "営業" }
  end

  factory :developer_department, class: Department do
    name { "開発" }
  end
end
