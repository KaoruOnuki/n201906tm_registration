class AddDetailsToTrademarks < ActiveRecord::Migration[5.2]
  def change
    add_column :trademarks, :tm_id, :integer, null: false
    add_column :trademarks, :tm_name, :string, null: false
    add_column :trademarks, :tm_image, :string
    add_column :trademarks, :description, :text, null: false
    add_column :trademarks, :investigation_result, :text
    add_column :trademarks, :investigation_date, :date
    add_column :trademarks, :apply_number, :integer
    add_column :trademarks, :apply_date, :date
    add_column :trademarks, :judge_status, :text
    add_column :trademarks, :registration_number, :integer
    add_column :trademarks, :registration_date, :date
    add_column :trademarks, :maintenance_period, :integer
  end
end
