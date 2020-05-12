# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, # 認証・サインイン
         :registerable, # サインアップ(アカウント作成)
         :recoverable, # パスワードリセット
         :rememberable, # 記憶トークン生成・削除
         :validatable # バリデーション設定
  #  :omniauthable, omniauth_providers: %i[twitter google_oauth2]
  has_many :posts, dependent: :destroy
end
