class AddDetailsoneToSupports < ActiveRecord::Migration[5.2]
  def change
    add_column :supports, :status, :string
  end
end
