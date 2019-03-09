class AddTrademarkIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :trademark_id, :integer
  end
end
