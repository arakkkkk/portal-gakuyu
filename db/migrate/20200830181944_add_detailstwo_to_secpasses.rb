class AddDetailstwoToSecpasses < ActiveRecord::Migration[5.2]
  def change
    add_column :secpasses, :tell, :string
  end
end
