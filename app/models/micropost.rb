# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :content
  has_many :likes, dependent: :destroy
end
