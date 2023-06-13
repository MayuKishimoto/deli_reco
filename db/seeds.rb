# Department.create!([
#   {name: "営業"},
#   {name: "開発"}
# ])

# Client.create!([
#   {name: "A社"},
#   {name: "B社"},
#   {name: "C社"}
# ])

# Category.create!([
#   {name: "生野菜サラダ"},
#   {name: "調理サラダ"},
#   {name: "スープ"},
#   {name: "おかず"},
#   {name: "おつまみ"},
#   {name: "麺"}
# ])

10.times do |n|
  User.create!(
    name: Faker::Name.name,
    number: 1000000000 + n,
    email: Faker::Internet.email,
    password: "password",
    admin: true
  )
  Product.create!(
    assumed_name: Faker::Food.dish,
    assumed_selling_price: 198,
    assumed_wholesale_price: 99,
    start_on: 3.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "季節のリニューアルのため",
    concept: "秋向けに具材と味付けを変更",
    # reference_image: ,
    status: 1,
    client_id: rand(1..3),
    category_id: rand(1..6),
    application_status: 1
  )
  Negotiation.create!(
    negotiate_at: 1.weeks.from_now,
    name: Faker::Food.dish,
    selling_price: 198,
    wholesale_price: 99,
    explanation: "寒い季節に向けて味にコクを出すため、マヨネーズを全卵タイプから卵黄タイプに変更しました。",
    user_id: 1,
    product_id: 1
  )
  Result.create!(
    content: "もう少しコクが欲しい。",
    user_id: 1,
    negotiation_id: 1
  )
end

# Affiliation.create!()
# Client_in_charge.create!()
# Product_in_charge.create!()