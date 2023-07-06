require 'open-uri'

Department.create!([
  {name: "営業"},
  {name: "開発"}
])

Client.create!([
  {name: "A社"},
  {name: "B社"},
  {name: "C社"}
])

Category.create!([
  {name: "生野菜サラダ"},
  {name: "調理サラダ"},
  {name: "スープ"},
  {name: "おかず"},
  {name: "麺"}
])

User.create!([
  {name: "営業ゲスト", number: 1000000001, email: "sales_guest@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "開発ゲスト", number: 1000000002, email: "developer_guest@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "営業＆開発ゲスト", number: 1000000003, email: "sales_developer_guest@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "佐藤聡子", number: 1000000004, email: "1000000004@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "鈴木浩", number: 1000000005, email: "1000000005@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "高橋貴子", number: 1000000006, email: "1000000006@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "田中隆", number: 1000000007, email: "1000000007@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "伊藤恵子", number: 1000000008, email: "1000000008@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "渡辺明", number: 1000000009, email: "1000000009@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "山本洋子", number: 1000000010, email: "1000000010@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "中村茂", number: 1000000011, email: "1000000011@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "小林佳子", number: 1000000012, email: "1000000012@example.com", password: SecureRandom.urlsafe_base64, admin: false},
  {name: "加藤清", number: 1000000013, email: "1000000013@example.com", password: SecureRandom.urlsafe_base64, admin: false}
])

Product.create!([
  {
    assumed_name: "シーザーサラダ",
    assumed_selling_price: 298,
    assumed_wholesale_price: 149,
    start_on: 3.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "既存品の販売数低下のためのリニューアル",
    concept: "こだわりたまごを使ったシーザーサラダ",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/salad.jpeg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 1,
    application_status: 1,
    user_id: 4
  },
  {
    assumed_name: "冷しゃぶサラダ",
    assumed_selling_price: 298,
    assumed_wholesale_price: 149,
    start_on: 2.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "夏向けサラダの導入",
    concept: "豚しゃぶたっぷり！自家製ポン酢で食べるサラダ",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_reisyabu_salad.jpeg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 1,
    application_status: 2,
    user_id: 4
  },
  {
    assumed_name: "ポテトサラダ",
    assumed_selling_price: 198,
    assumed_wholesale_price: 99,
    start_on: 4.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "定番商品の季節向け味変更",
    concept: "秋向けに味にコクを出すため、マヨネーズを卵黄タイプに変更",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_potato_sald.jpg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 2,
    application_status: 1,
    user_id: 5
  },
  {
    assumed_name: "コールスローサラダ",
    assumed_selling_price: 198,
    assumed_wholesale_price: 99,
    start_on: 3.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "離水が多いため仕様の改善をお願いしたいです",
    concept: "マヨネーズを高粘度のタイプに変更し、店頭でも立体感のある見た目を維持できる",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_vegetable_coleslaw_salad.jpeg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 2,
    application_status: 2,
    user_id: 5
  },
  {
    assumed_name: "ミネストローネスープ",
    assumed_selling_price: 298,
    assumed_wholesale_price: 149,
    start_on: 5.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "季節野菜を使用したスープの導入による販売数増",
    concept: "夏野菜を使用した具沢山のミネストローネ",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/soup_minestrone.jpeg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 3,
    application_status: 1,
    user_id: 6
  },
  {
    assumed_name: "わかめスープ",
    assumed_selling_price: 198,
    assumed_wholesale_price: 99,
    start_on: 4.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "韓国フェアの販促のため、定番商品を韓国風にアレンジして導入",
    concept: "韓国の焼肉店で出てくるような本格わかめスープ",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/soup_wakame.jpeg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 3,
    application_status: 2,
    user_id: 6
  },
  {
    assumed_name: "ほうれん草の胡麻和え",
    assumed_selling_price: 198,
    assumed_wholesale_price: 99,
    start_on: 6.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "定番商品のリニューアル",
    concept: "秋冬に向け、練りごまを使用することでコクを出す",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/hourensou_gomaae.jpg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 4,
    application_status: 1,
    user_id: 7
  },
  {
    assumed_name: "ほうれん草の白和え",
    assumed_selling_price: 198,
    assumed_wholesale_price: 99,
    start_on: 5.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "新しく工場に導入した機械の活用",
    concept: "豆腐の食感をなめらかにした口当たりの良い白和え",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_shiraae.jpg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 4,
    application_status: 2,
    user_id: 7
  },
  {
    assumed_name: "カルボナーラ",
    assumed_selling_price: 398,
    assumed_wholesale_price: 199,
    start_on: 7.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "先方より、監修商品の導入依頼がありました",
    concept: "シェフ監修！４種のチーズを使ったカルボナーラ",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_spaghetti_carbonara.jpeg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 5,
    application_status: 1,
    user_id: 8
  },
  {
    assumed_name: "焼きそば",
    assumed_selling_price: 298,
    assumed_wholesale_price: 149,
    start_on: 6.months.from_now,
    period: "３ヶ月",
    volume: 300,
    purpose: "人気店をベンチマークにした商品の導入",
    concept: "香ばしさが特徴の焼きそば",
    reference_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_yakisoba.jpeg"),
    status: 1,
    client_id: rand(1..3),
    category_id: 5,
    application_status: 2,
    user_id: 8
  }
])

Negotiation.create!([
  {
    negotiate_at: 1.weeks.ago,
    name: "冷しゃぶサラダ",
    selling_price: 298,
    wholesale_price: 149,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_reisyabu_salad.jpeg"),
    explanation: "豚しゃぶがメインのボリューム感のあるサラダです。自家製のポン酢はゆずをメインにすだちも使用し、さっぱりと食べられる仕立てにました。",
    user_id: 9,
    product_id: 2
  },
  {
    negotiate_at: Date.today,
    name: "冷しゃぶサラダ",
    selling_price: 298,
    wholesale_price: 149,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_reisyabu_salad.jpeg"),
    explanation: "前回よりすだちの比率を上げました。",
    user_id: 9,
    product_id: 2
  },
  {
    negotiate_at: 1.weeks.ago,
    name: "コールスローサラダ",
    selling_price:  198,
    wholesale_price: 9,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_vegetable_coleslaw_salad.jpeg"),
    explanation: "マヨネーズを高粘度タイプに変更して離水を抑えました。経時変化の確認に関しては、結果が出しだいお伝えします。",
    user_id: 10,
    product_id: 4
  },
  {
    negotiate_at: Date.today,
    name: "コールスローサラダ",
    selling_price: 198,
    wholesale_price: 99,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_vegetable_coleslaw_salad.jpeg"),
    explanation: "前回の検証の結果がよくなかったので、違うタイプのマヨネーズに変更しました。",
    user_id: 10,
    product_id: 4
  },
  {
    negotiate_at: 1.weeks.ago,
    name: "わかめスープ",
    selling_price: 198,
    wholesale_price: 99,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/soup_wakame.jpeg"),
    explanation: "本場韓国のレシピを参考にし、牛肉を使った穀のあるわかめスープに仕立てました。",
    user_id: 11,
    product_id: 6
  },
  {
    negotiate_at: Date.today,
    name: "わかめスープ",
    selling_price: 198,
    wholesale_price: 99,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/soup_wakame.jpeg"),
    explanation: "牛肉の量を前回より増やしています。原料費が上がったため、わかめの量を減らして調整しております。",
    user_id: 11,
    product_id: 6
  },
  {
    negotiate_at: 1.weeks.ago,
    name: "ほうれん草の白和え",
    selling_price: 198,
    wholesale_price: 99,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_shiraae.jpg"),
    explanation: "豆腐を機械にかけることで豆腐の固形感がなくなり、なめらかな食感の白和えとなっております",
    user_id: 12,
    product_id: 8
  },
  {
    negotiate_at: Date.today,
    name: "ほうれん草の白和え",
    selling_price: 198,
    wholesale_price: 99,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_shiraae.jpg"),
    explanation: "まだ固形感があるとのことでしたので、機械の設定を変更し、食感を改良しました。",
    user_id: 12,
    product_id: 8
  },
  {
    negotiate_at: 1.weeks.ago,
    name: "焼きそば",
    selling_price: 298,
    wholesale_price: 149,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_yakisoba.jpeg"),
    explanation: "麺を焼き付ける時間を通常より長くすることで、香ばしさを出しています。",
    user_id: 13,
    product_id: 10
  },
  {
    negotiate_at: Date.today,
    name: "焼きそば",
    selling_price: 298,
    wholesale_price: 149,
    product_image: URI.open("https://aws-deli-reco-production.s3.ap-northeast-1.amazonaws.com/uploads/product/reference_image/seed/food_yakisoba.jpeg"),
    explanation: "過加熱による麺のちぎれを防ぐため、麺の種類を変更しました。",
    user_id: 13,
    product_id: 10
  }
])

Result.create!([
    {
      content: "もう少しすだちの味と香りが感じられるようにしてほしい。",
      user_id: 4,
      negotiation_id: 1
    },
    {
      content: "現行品より離水が抑えられているが、まだ水分量が多く感じる。もう少し抑えられないか。",
      user_id: 5,
      negotiation_id: 3
    },
    {
      content: "スープの味は牛のうまみを感じられて良いが、肉の量が少なく感じる。量を増やせないか。",
      user_id: 6,
      negotiation_id: 5
    },
    {
      content: "一般的なものより比較的なめらかな食感になっているが、少し固形感が残っている。完全になめらかにできないか。",
      user_id: 7,
      negotiation_id: 7
    },
    {
      content: "香ばしさは感じられるが、加熱時間が長いせいか、麺が短くなってしまっている。改善をお願いします。",
      user_id: 8,
      negotiation_id: 9
    },
  ])

Affiliation.create!([
  {user_id: 1, department_id: 1},
  {user_id: 2, department_id: 2},
  {user_id: 3, department_id: 1},
  {user_id: 3, department_id: 2},
  {user_id: 4, department_id: 1},
  {user_id: 5, department_id: 1},
  {user_id: 6, department_id: 1},
  {user_id: 7, department_id: 1},
  {user_id: 8, department_id: 1},
  {user_id: 9, department_id: 2},
  {user_id: 10, department_id: 2},
  {user_id: 11, department_id: 2},
  {user_id: 12, department_id: 2},
  {user_id: 13, department_id: 2}
])

ClientInCharge.create!([
  {user_id: 1, client_id: rand(1..3)},
  {user_id: 2, client_id: rand(1..3)}
])

ProductInCharge.create!([
  {user_id: 4, product_id: 2},
  {user_id: 5, product_id: 4},
  {user_id: 6, product_id: 6},
  {user_id: 7, product_id: 8},
  {user_id: 8, product_id: 10}
])

# 10.times do |n|
#   ProductInCharge.create!(
#     user_id: 2,
#     product_id: 1 + n
#   )
# end