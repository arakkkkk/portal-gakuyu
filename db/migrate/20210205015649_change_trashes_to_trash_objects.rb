class ChangeTrashesToTrashObjects < ActiveRecord::Migration[6.1]
  def change
    rename_table :portalnotes, :notelists
  end
end
