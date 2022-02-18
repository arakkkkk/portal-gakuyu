class AddDetailsToSecpasses < ActiveRecord::Migration[5.2]
  def change
    add_column :secpasses, :macname, :string
    add_column :secpasses, :error, :string
  end
end
