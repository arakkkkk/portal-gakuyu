class AddDetailsoneToFacilities < ActiveRecord::Migration[5.2]
  def change
    add_column :facilities, :katudo_naiyo, :text
    add_column :facilities, :email, :string
    add_column :facilities, :katudo_num, :integer
  end
end
