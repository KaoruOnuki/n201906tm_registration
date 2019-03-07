class RemoveTmIdFromTrademarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :trademarks, :tm_id, :integer
  end
end
