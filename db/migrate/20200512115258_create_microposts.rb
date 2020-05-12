# frozen_string_literal: true

class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.string :title
      t.references :post, null: true, foreigy_key: true
      t.references :user, null: false, foreigy_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
