class CreatePortalnotegroups < ActiveRecord::Migration[6.1]
  def change
    create_table :portalnotegroups do |t|
      t.string :groupone
      t.string :grouptwo
      t.string :groupthree
      t.string :type

      t.timestamps
    end
  end
end
