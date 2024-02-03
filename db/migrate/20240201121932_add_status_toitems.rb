class AddStatusToitems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :status, :string, default: 'active', null: false
  end
end
