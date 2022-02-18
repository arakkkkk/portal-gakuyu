class CreatePortaltexts < ActiveRecord::Migration[6.1]
  def change
    create_table :portaltexts do |t|
      t.text :content
      t.string :parent
      t.string :check
      t.string :group

      t.timestamps
    end
  end
end
