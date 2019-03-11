class ChangeTypeIntegerToStringTrademarks < ActiveRecord::Migration[5.2]
  def change
    change_column :trademarks, :apply_number, :string
    change_column :trademarks, :registration_number, :string
  end
end
