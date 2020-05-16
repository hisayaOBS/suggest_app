class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  belongs_to :post
end
