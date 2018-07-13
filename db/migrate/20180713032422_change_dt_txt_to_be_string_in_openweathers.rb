class ChangeDtTxtToBeStringInOpenweathers < ActiveRecord::Migration[5.2]
  def up 
    change_column :openweathers, :dt_txt, :string 
  end 
  def down 
    change_column :openweathers, :dt_txt, :datetime 
  end 
end
