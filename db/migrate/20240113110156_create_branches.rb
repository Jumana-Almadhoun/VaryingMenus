class CreateBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end
  end
end
