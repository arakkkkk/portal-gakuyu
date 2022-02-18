class AddDetailsToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :setumei, :string
  end
end
