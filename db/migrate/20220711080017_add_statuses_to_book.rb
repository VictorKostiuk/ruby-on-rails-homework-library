class AddStatusesToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :status, :string, null: false, default: :in_stock
  end
end
