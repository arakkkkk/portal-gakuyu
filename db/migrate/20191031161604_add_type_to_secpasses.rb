class AddTypeToSecpasses < ActiveRecord::Migration[5.2]
  def change
    add_column :secpasses, :type, :string
  end
end
