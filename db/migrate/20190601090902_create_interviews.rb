class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.integer :age,      null: false
      t.string :sex,      null: false
      t.string :career,      null: false
      t.string :use_service,      null: false
      t.string :existing_service_uncomfortable,      null: false
      t.integer :subscribe_channel_number,      null: false
      t.string :like_category,      null: false
      t.text :good_point,      null: false
      t.text :bad_point,      null: false
      t.integer :recommendation,      null: false
      t.text :cause,      null: false
      t.string :screenshot,      null: false
      t.string :favorite_site,      null: false
      t.string :period,      null: false
      t.string :highlight_video,      null: false
      t.string :what_highlight_video,      null: false
      t.string :how_long_watch,      null: false
      t.string :when_watch,      null: false
      t.string :email,      null: false
      t.string :phone_number,      null: false
      t.string :gift,      null: false

      t.timestamps
    end
  end
end
