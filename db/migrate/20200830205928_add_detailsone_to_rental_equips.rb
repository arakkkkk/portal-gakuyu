class AddDetailsoneToRentalEquips < ActiveRecord::Migration[5.2]
  def change
    add_column :rental_equips, :katudo_num, :integer
    add_column :rental_equips, :katudo_naiyo, :text
    add_column :rental_equips, :email, :string
    add_column :rental_equips, :place, :string
  end
end
