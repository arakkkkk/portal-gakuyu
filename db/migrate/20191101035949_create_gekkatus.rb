class CreateGekkatus < ActiveRecord::Migration[5.2]
  def change
    create_table :gekkatus do |t|
      t.string :name
      t.string :year
      t.string :month
      t.string :file_name
      t.binary :file

      t.timestamps
    end
  end
end
