class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.string :city1
      t.string :city2
      t.float :lon
      t.float :lat

      t.timestamps
    end
  end
end
