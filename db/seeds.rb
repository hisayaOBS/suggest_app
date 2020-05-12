# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# frozen_string_literal: true

User.create!(name: '三好久也',
             email: 'h.miyoshi948@gmail.com',
             kana: 'ミヨシヒサヤ',
             password: 'foobar')

user = User.first

user.posts.create!(section: '公医イ',
                   title: 'スポフェステーマについて',
                   start_date: '2020-05-12',
                   end_date: '2020-06-01',
                   count_limit: '1')

user.posts.create!(section: '情',
                   title: '言語の選択について',
                   start_date: '2020-05-12',
                   end_date: '2020-06-01',
                   count_limit: '3')

user.posts.create!(section: '医',
                   title: '病院実習の回数について',
                   start_date: '2020-05-12',
                   end_date: '2020-06-01',
                   count_limit: '2')

user.posts.create!(section: 'イ',
                   title: 'コロナ禍でのイベント実施について',
                   start_date: '2020-05-12',
                   end_date: '2020-06-01',
                   count_limit: '5')

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n + 1}@railstutorial.org"
#   password = 'password'
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password)
# end

# 登録日が古い最初の6名を抽出
# users = User.order(:created_at).take(6)
# # 50回ループ
# 50.times do
#   content = Faker::Lorem.sentence(word_count: 5) # contentにランダムな文を代入
#   # 6名のユーザをeach し、ランダムな分をマイクロソフトへ投稿する
#   users.each { |user| user.microposts.create!(content: content) }
# end
