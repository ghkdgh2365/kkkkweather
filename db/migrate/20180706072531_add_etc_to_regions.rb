class AddEtcToRegions < ActiveRecord::Migration[5.2]
  def change
    add_column :regions, :etc, :string
  end
end
