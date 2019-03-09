class AddTmnameToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :tmname, :string
  end
end
