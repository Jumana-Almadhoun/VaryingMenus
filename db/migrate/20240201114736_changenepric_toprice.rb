class ChangenepricToprice < ActiveRecord::Migration[7.1]
  def change
    rename_column :order_items, :pric, :price
  end
end
