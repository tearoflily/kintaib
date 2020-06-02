class ChangeBasicTimeToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :basic_time, :time
  end
end
