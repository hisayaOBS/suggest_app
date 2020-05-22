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

Faker::Config.locale = 'ja'


user = User.first

user.posts.create!(section: '公医イ',
                   title: 'スポフェステーマについて',
                   start_date: '2020-05-12',
                   end_date: '2020-05-15',
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
                   end_date: '2020-05-13',
                   count_limit: '5')

user.posts.create!(section: 'ビ情公医イ',
                   title: 'コロナ禍でのイベント実施についてver2',
                   start_date: '2020-05-12',
                   end_date: '2020-05-18',
                   count_limit: '5')

p1 = Post.order(:created_at).take(5)



3.times do
  user_id = 1
  title = Faker::Lorem.sentence(word_count: 2)
  content = Faker::Lorem.sentence(word_count: 12) # contentにランダムな文を代入
  # 6名のユーザをeach し、ランダムな分をマイクロソフトへ投稿する
  p1.each { |post| post.microposts.create!(content: content, title: title, user_id: user_id) }
end

User.create!(name: '山田太郎',
             email: 'example@gmail.com',
             kana: 'ヤマダタロウ',
             password: 'foobar')

user = User.second

user.posts.create!(section: '公医イ',
                   title: 'スポフェステーマについて',
                   start_date: '2020-05-12',
                   end_date: '2020-05-15',
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
                   end_date: '2020-05-13',
                   count_limit: '5')

user.posts.create!(section: 'ビ情公医イ',
                   title: 'コロナ禍でのイベント実施について',
                   start_date: '2020-05-12',
                   end_date: '2020-05-18',
                   count_limit: '5')

p1 = Post.order(:created_at).take(5)

3.times do
  user_id = 2
  title = Faker::Lorem.sentence(word_count: 2)
  content = Faker::Lorem.sentence(word_count: 12) # contentにランダムな文を代入
  # 6名のユーザをeach し、ランダムな分をマイクロソフトへ投稿する
  p1.each { |post| post.microposts.create!(content: content, title: title, user_id: user_id) }
end

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               kana:"テスト用"
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(50)

users.each{|u| Like.create!(user_id: u.id, micropost_id: 1, post_id: 1, )}
users.each{|u| Like.create!(user_id: u.id, micropost_id: 3, post_id: 2, )}
users.each{|u| Like.create!(user_id: u.id, micropost_id: 1, post_id: 3, )}
users.each{|u| Like.create!(user_id: u.id, micropost_id: 3, post_id: 1, )}
users.each{|u| Like.create!(user_id: u.id, micropost_id: 1, post_id: 1, )}














# 登録日が古い最初の6名を抽出
# users = User.order(:created_at).take(6)
# # 50回ループ
# 50.times do
#   content = Faker::Lorem.sentence(word_count: 5) # contentにランダムな文を代入
#   # 6名のユーザをeach し、ランダムな分をマイクロソフトへ投稿する
#   users.each { |user| user.microposts.create!(content: content) }
# end
