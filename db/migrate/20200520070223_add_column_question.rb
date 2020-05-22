# frozen_string_literal: true

class AddColumnQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :answer, :boolean
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
