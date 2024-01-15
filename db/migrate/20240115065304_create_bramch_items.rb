class CreateBramchItems < ActiveRecord::Migration[7.1]
  def change
    create_table :bramch_items do |t|
      t.integer :

      t.timestamps
    end
  end
end
