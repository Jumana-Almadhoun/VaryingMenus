class AddOrderIdToOrderItems < ActiveRecord::Migration[7.1]
  def change
    add_column :order_items, :order_id, :integer
  end
end
