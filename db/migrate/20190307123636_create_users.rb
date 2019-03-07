class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name ,null: false
      t.integer :phone_number
      t.string :email ,null: false
      t.integer :postal_code
      t.string :prefecture
      t.string :address1
      t.string :address2
      t.string :company_name
      t.string :website
      t.string :contact_method
      t.string :contact_time
      t.boolean :experienced
      t.boolean :agreed_regulation
      t.string :password_digest
      t.datetime :created_at ,null: false
      t.datetime :updated_at ,null: false
      t.timestamps
    end
  end
end
