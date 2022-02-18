class RenameWheatherColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :notelists, :type, :dataset
  end
end
