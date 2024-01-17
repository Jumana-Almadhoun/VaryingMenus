class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :branch_id
      t.integer :item_id
      t.string :username
      t.decimal :total

      t.timestamps
    end
  end
end
