class AddIndexToAdminUsersAdminEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :admin_users, :admin_email, unique: true
  end
end
