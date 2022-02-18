class AddRemenberToken2ToSecpasses < ActiveRecord::Migration[5.2]
  def change
    add_column :secpasses, :remember_token, :string
  end
end
