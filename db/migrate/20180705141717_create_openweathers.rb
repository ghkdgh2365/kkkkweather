class CreateOpenweathers < ActiveRecord::Migration[5.2]
  def change
    create_table :openweathers do |t|
      t.integer :region_id
      t.float :temp
      t.string :weather
      t.string :description
      t.string :icon
      t.datetime :dt_txt

      t.timestamps
    end
  end
end
