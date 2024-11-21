class AddUserRefToProducts < ActiveRecord::Migration[8.0]
  def change
    add_reference :products, :user, null: false, foreign_key: true
    add_reference :products, :category, null: false, foreign_key: true
  end
end
