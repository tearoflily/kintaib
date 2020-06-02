class ChangeDefaultToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :work_time, Time.current.change(hour: 8, min: 0, sec: 0))
  end
end
