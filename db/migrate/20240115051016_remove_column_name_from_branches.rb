class RemoveColumnNameFromBranches < ActiveRecord::Migration[7.1]
  def change
    remove_column :branches, :menu_id, :integer
  end
end
