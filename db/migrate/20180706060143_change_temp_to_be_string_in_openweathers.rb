class ChangeTempToBeStringInOpenweathers < ActiveRecord::Migration[5.2]
  def up 
    change_column :openweathers, :temp, :string 
  end 
  def down 
    change_column :openweathers, :temp, :float 
  end 
end
