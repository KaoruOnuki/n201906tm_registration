class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.integer :phone_number, null: false
      t.string :email
      t.string :company_name
      t.string :website
      t.text :content, null: false
      t.boolean :preferred_contact
      t.string :contact_time
      t.boolean :experienced
      t.boolean :agreed_regulation, null: false
      t.boolean :used, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.timestamps
    end
  end
end
