class DropMenu < ActiveRecord::Migration[7.1]
  def change
    drop_table :menus

  end
end
