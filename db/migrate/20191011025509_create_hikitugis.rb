class CreateHikitugis < ActiveRecord::Migration[5.2]
  def change
    create_table :hikitugis do |t|
      t.string :title
      t.string :text
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
