class RemoveNameFromTrademarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :trademarks, :name, :text
  end
end
