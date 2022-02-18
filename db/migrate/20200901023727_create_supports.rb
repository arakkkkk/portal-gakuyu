class CreateSupports < ActiveRecord::Migration[5.2]
  def change
    create_table :supports do |t|
      t.string :name
      t.string :email
      t.string :tell
      t.text :text
      t.string :g_name
      t.datetime :time
      t.string :cate

      t.timestamps
    end
  end
end
