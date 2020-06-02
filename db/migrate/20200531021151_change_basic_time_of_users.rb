class ChangeBasicTimeOfUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :basic_time, :datetime, default: "2020-05-14 00:00:00"
    change_column :users, :work_time, :datetime, default: "2020-05-13 23:00:00"
  end
  
  def down
    change_column :users, :basic_time, :datetime, default: Time.current.change(hour: 8, min: 0, sec: 0)
    change_column :users, :work_time, :datetime, default: Time.current.change(hour: 7, min: 30, sec: 0)
  end
end
