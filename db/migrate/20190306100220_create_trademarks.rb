class CreateTrademarks < ActiveRecord::Migration[5.2]
  def change
    create_table :trademarks do |t|
      t.text :name

      t.timestamps
    end
  end
end
