class AddOthersToAsRentalequip < ActiveRecord::Migration[5.2]
  def change
    add_column :as_rentalequips, :text, :string
    add_column :as_rentalequips, :num, :integer
    add_reference :as_rentalequips, :rnum, foreign_key: true
  end
end
