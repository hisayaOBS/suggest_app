# frozen_string_literal: true

class AddColumnQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :section, :string
  end
end
