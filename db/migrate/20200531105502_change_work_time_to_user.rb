class ChangeWorkTimeToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :work_time, :time
  end
end
