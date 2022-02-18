class CreateKyoyuhainotis < ActiveRecord::Migration[5.2]
  def change
    create_table :kyoyuhainotis do |t|
      t.string :title
      t.string :text
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
