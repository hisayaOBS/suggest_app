# frozen_string_literal: true

class AddColumnQuestion02 < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :answer, :boolean
    remove_column :questions, :answer
  end
end
