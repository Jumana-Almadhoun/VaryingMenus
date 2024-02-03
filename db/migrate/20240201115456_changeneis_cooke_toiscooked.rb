class ChangeneisCookeToiscooked < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :is_cooke, :is_cooked
  end
end
