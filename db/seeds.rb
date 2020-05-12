# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# frozen_string_literal: true

User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

# 登録日が古い最初の6名を抽出
users = User.order(:created_at).take(6)
# 50回ループ
50.times do
  content = Faker::Lorem.sentence(word_count: 5) # contentにランダムな文を代入
  # 6名のユーザをeach し、ランダムな分をマイクロソフトへ投稿する
  users.each { |user| user.microposts.create!(content: content) }
end
