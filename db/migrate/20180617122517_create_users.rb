class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_key
      t.string :region
      t.integer :regist_check
      t.string :phone
      t.string :add_check
      t.string :etc

      t.timestamps
    end
  end
end
