class CreateRentalEquips < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_equips do |t|
      t.string :name
      t.integer :r_num
      t.datetime :rental_at
      t.datetime :return_at
      t.string :g_name
      t.string :r_name
      t.string :tell
      t.string :no_text

      t.timestamps
    end
  end
end
