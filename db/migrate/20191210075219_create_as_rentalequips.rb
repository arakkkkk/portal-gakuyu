class CreateAsRentalequips < ActiveRecord::Migration[5.2]
  def change
    create_table :as_rentalequips do |t|
      t.references :equipment, foreign_key: true
      t.references :rental_equip, foreign_key: true

      t.timestamps
    end
  end
end
