class ChangeNotNullToContacts < ActiveRecord::Migration[5.2]
  def up
    change_column_null :contacts, :name, true
    change_column_null :contacts, :phone_number, true
    change_column_null :contacts, :content, true
    change_column_null :contacts, :agreed_regulation, true
    change_column_null :contacts, :used, true
  end

  def down
    change_column_null :contacts, :name, false
    change_column_null :contacts, :phone_number, false
    change_column_null :contacts, :content, false
    change_column_null :contacts, :agreed_regulation, false
    change_column_null :contacts, :used, false
  end
end
