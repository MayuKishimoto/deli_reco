FactoryBot.define do
  factory :user do
    name { "test_user" }
    number { 1 }
    email { "test@example.com" }
    password { "password" }
  end

  factory :sales_user, class: User do
    name { "test_sales_user" }
    number { 2 }
    email { "test_sales@example.com" }
    password { "password" }

    after(:create) do |sales_user|
      create_list(:affiliation, 1, user: sales_user, department: create(:sales_department))
    end
  end

  factory :developer_user, class: User do
    name { "test_developer_user" }
    number { 3 }
    email { "test_developer@example.com" }
    password { "password" }

    after(:create) do |developer_user|
      create_list(:affiliation, 1, user: developer_user, department: create(:developer_department))
    end
  end

  factory :admin_user, class: User do
    name { "test_admin_user" }
    number { 4 }
    email { "test_admin@example.com" }
    password { "password" }
    admin { true }
  end
end
