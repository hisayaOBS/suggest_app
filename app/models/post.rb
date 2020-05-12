# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :microposts, dependent: :destroy
  validates :title, presence: true
  validates :section, presence: true
end
