# frozen_string_literal: true

class Section < ActiveHash::Base
  # 静的データ生成(モデルにする必要もない、更新のないデータ群)
  # include ActiveHash::Associations # 追記
  self.data = [
    { id: 1, name: 'ビジネス' },
    { id: 2, name: '情報' },
    { id: 3, name: '医療' },
    { id: 4, name: '公務員' },
    { id: 5, name: '広報' },
    { id: 6, name: '総務' }
  ]
  # has_many :users
end
