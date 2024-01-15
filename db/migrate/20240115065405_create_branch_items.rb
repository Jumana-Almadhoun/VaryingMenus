class CreateBranchItems < ActiveRecord::Migration[7.1]
  def change
    create_table :branch_items do |t|
      t.integer :branch_id
      t.integer :item_id
      t.decimal :price
      t.integer :available_qty
      t.timestamps
    end
  end
end
