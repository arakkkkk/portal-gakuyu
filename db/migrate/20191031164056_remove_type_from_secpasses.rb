class RemoveTypeFromSecpasses < ActiveRecord::Migration[5.2]
  def change
    remove_column :secpasses, :type, :string
  end
end
