class AddAlarmTimeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :alarm_time, :time
  end
end
