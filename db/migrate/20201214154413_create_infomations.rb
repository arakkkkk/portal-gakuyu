class CreateInfomations < ActiveRecord::Migration[6.1]
  def change
    create_table :infomations do |t|
      t.string :account
      t.string :title
      t.string :text
      t.string :type
      t.date :date
      t.string :badgelist
      t.string :done
      t.string :pin

      t.timestamps
    end
  end
end
