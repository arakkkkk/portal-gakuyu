class CreateRnums < ActiveRecord::Migration[5.2]
  def change
    create_table :rnums do |t|
      t.string :text
      t.integer :num

      t.timestamps
    end
  end
end
