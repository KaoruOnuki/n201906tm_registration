class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.boolean :status_investigation
      t.boolean :status_apply
      t.boolean :status_judge
      t.boolean :status_registration
      t.belongs_to :trademark, index: true
      t.timestamps
    end
  end
end
