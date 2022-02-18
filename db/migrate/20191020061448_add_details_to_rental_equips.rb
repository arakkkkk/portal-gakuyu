class AddDetailsToRentalEquips < ActiveRecord::Migration[5.2]
  def change
    add_column :rental_equips, :setumei, :string
  end
end
