# frozen_string_literal: true

class AddIndexLike < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, %i[post_id micropost_id user_id], unique: true
  end
end
