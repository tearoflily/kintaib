class ChangeBasicTimeToUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :basic_time
    change_column :users, :work_time
  end
  
  def down
    change_column :users, :basic_time, :datetime, default: Time.current.change(hour: 8, min: 0, sec: 0)
    change_column :users, :work_time, :datetime, default: Time.current.change(hour: 7, min: 30, sec: 0)
  end
end
