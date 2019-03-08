class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :admin_name ,null: false
      t.string :admin_email ,null: false
      t.string :password_digest
      t.datetime :created_at ,null: false
      t.datetime :updated_at ,null: false
      t.timestamps
    end
  end
end
