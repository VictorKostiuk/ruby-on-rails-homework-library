# frozen_string_literal: true

class AddStatusesToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :status, :string, null: false, default: :ready_for_order
  end
end
