class Rnum < ApplicationRecord
	has_many :as_rentalequips
        has_many :equipment, through: :as_rentalequips
        has_many :rental_equips, through: :as_rentalequips
end
