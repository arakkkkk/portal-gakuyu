class CreatePortalnotes < ActiveRecord::Migration[6.1]
  def change
    create_table :portalnotes do |t|
      t.string :parent
      t.string :title
      t.text :content
      t.string :state
      t.string :passset
      t.string :type

      t.timestamps
    end
  end
end
