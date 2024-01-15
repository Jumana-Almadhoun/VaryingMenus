class AddMenuIdToBranch < ActiveRecord::Migration[7.1]
  def change
    add_column :branches, :menu_id, :int
  end
end
