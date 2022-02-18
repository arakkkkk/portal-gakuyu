class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :number
      t.integer :max_number

      t.timestamps
    end
  end
end
