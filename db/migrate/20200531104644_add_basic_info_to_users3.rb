class AddBasicInfoToUsers3 < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :basic_time, :datetime
    add_column :users, :work_time, :datetime
  end
end
