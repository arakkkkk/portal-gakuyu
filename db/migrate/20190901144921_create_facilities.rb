class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :room
      t.datetime :rental_at
      t.datetime :return_at
      t.string :g_name
      t.string :r_name
      t.string :tell
      t.string :kyoka
      t.string :kasidasi
      t.string :henkyaku
      t.string :youbousyo

      t.timestamps
    end
  end
end
