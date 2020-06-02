class RenameRemeberDigestColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :remeber_digest, :remember_digest
  end
end
