class AddKyokanameToRentalEquip < ActiveRecord::Migration[5.2]
  def change
    add_column :rental_equips, :kyoka, :string
    add_column :rental_equips, :kasidasi, :string
    add_column :rental_equips, :henkyaku, :string
    add_column :rental_equips, :youbousyo, :string
  end
end
