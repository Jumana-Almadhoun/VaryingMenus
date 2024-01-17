class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.decimal :pric
      t.integer :qty
      t.timestamps
    end
  end
end
