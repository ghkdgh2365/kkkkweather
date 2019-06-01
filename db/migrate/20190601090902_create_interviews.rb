class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.integer :age
      t.string :sex
      t.string :career
      t.string :use_service
      t.string :existing_service_uncomfortable
      t.integer :subscribe_channel_number
      t.string :like_category
      t.text :good_point
      t.text :bad_point
      t.integer :recommendation
      t.text :cause
      t.string :screenshot
      t.string :favorite_site
      t.string :period
      t.string :highlight_video
      t.string :what_highlight_video
      t.string :how_long_watch
      t.string :when_watch
      t.string :email
      t.string :phone_number
      t.string :gift

      t.timestamps
    end
  end
end
