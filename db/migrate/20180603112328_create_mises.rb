class CreateMises < ActiveRecord::Migration[5.2]
  def change
    create_table :mises do |t|
      t.text :mise_info
      t.text :ozone_info

      t.timestamps
    end
  end
end
