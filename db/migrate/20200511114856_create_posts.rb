# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :section
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :count_limit
      t.references :user, null: false, foreigy_key: true

      t.timestamps
    end
  end
end
